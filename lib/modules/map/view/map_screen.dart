import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:heyyo_trip/modules/map/feature/place_model.dart';
import 'package:heyyo_trip/modules/map/feature/place_service.dart';
import 'package:heyyo_trip/modules/map/widget/appbar.dart';
import 'package:heyyo_trip/modules/map/widget/map_place_section.dart';
import 'package:heyyo_trip/modules/map/widget/marker.dart';
import 'package:flutter/foundation.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  bool _mapReady = false;
  StreamSubscription<ServiceStatus>? _serviceStatusSubscription;
  Set<Marker> _markers = {};
  List<PlaceModel> places = [];
  Map<MarkerId, BitmapDescriptor> generatedMarkerIcons = {};
  PlaceModel? _selectedPlace;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadPlaces();
    if (!kIsWeb) {
      _serviceStatusSubscription =
          Geolocator.getServiceStatusStream().listen((status) {
        if (status == ServiceStatus.enabled) {
          _getCurrentLocation();
        }
      });
    }
  }

  @override
  void dispose() {
    _serviceStatusSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Location Required'),
            content: const Text(
                'Please enable your device\'s location services to use the map.'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Geolocator.openLocationSettings();
                },
                child: const Text('Open Settings'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      }
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) return;
    }
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      if (_mapController != null && _mapReady) _moveCameraToCurrentLocation();
    } catch (e) {
      print("❌ Error getting location: $e");
    }
  }

  void _moveCameraToCurrentLocation() {
    if (_currentLocation != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(_currentLocation!, 14),
      );
    }
  }

  Future<void> _loadPlaces() async {
    places = await PlaceService.fetchPlaces();
    setState(() {}); // Cập nhật danh sách places
  }

  void _updateMarkers() {
    // Tạo marker dựa trên generatedMarkerIcons đã capture thành công.
    Set<Marker> newMarkers = {};
    for (var place in places) {
      final icon = generatedMarkerIcons[MarkerId(place.name)];
      if (icon != null) {
        newMarkers.add(
          Marker(
            markerId: MarkerId(place.name),
            position: LatLng(place.latitude, place.longitude),
            icon: icon,
            onTap: () {
              setState(() {
                _selectedPlace = place;
              });
              final index = places.indexWhere((p) => p.name == place.name);
              if (index != -1) {
                final screenWidth = MediaQuery.of(context).size.width;
                final cardWidth = screenWidth - 80; // chiều rộng card
                const margin = 10.0; // khoảng cách giữa các card
                // Tính offset để card được căn giữa
                double offset = index * (cardWidth + margin) -
                    (screenWidth / 2) +
                    (cardWidth / 2);
                // Đảm bảo offset không âm
                offset = offset < 0 ? 0 : offset;
                _scrollController.animateTo(
                  offset,
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        );
      }
    }
    setState(() {
      _markers = newMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Nếu chưa có vị trí hoặc chưa load xong places, hiển thị loading.
    if (_currentLocation == null || places.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: const MapAppBar(
        name: 'Ha Noi, Vietnam',
        description: 'May 06 - May 08, 1 Room, 3 Travellers',
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            initialCameraPosition:
                CameraPosition(target: _currentLocation!, zoom: 14),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              _mapController = controller;
              _mapReady = true;
              Future.delayed(const Duration(milliseconds: 300), () {
                _moveCameraToCurrentLocation();
              });
            },
          ),
          // Chèn MarkerGenerator vào cây widget, nhưng đặt ngoài màn hình.
          // Điều này đảm bảo widget được layout và paint, nhưng không chiếm vị trí trên UI.
          Positioned(
            top: -1000,
            left: -1000,
            child: MarkerGenerator(
              places: places,
              onGenerated: (icons) {
                generatedMarkerIcons = icons;
                _updateMarkers();
              },
            ),
          ),
          // Phần hiển thị danh sách các place
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: MapPlaceSection(
              scrollController: _scrollController,
              places: places,
              selectedPlace: _selectedPlace,
              onPlaceTap: (place) {
                setState(() {
                  _selectedPlace = place;
                });
                _mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(
                      LatLng(place.latitude, place.longitude), 18),
                );
              },
            ),
          ),
          if (_selectedPlace != null)
            Positioned(
              top: 55,
              left: 16,
              right: 16,
              child: Material(
                color: Colors.white,
                elevation: 4,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedPlace!.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Rate: ${_selectedPlace!.rate}/5'),
                            Text('Price: ${_selectedPlace!.price}'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _selectedPlace = null;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MarkerGenerator extends StatefulWidget {
  final List<PlaceModel> places;
  final Function(Map<MarkerId, BitmapDescriptor> icons) onGenerated;

  const MarkerGenerator({
    Key? key,
    required this.places,
    required this.onGenerated,
  }) : super(key: key);

  @override
  State<MarkerGenerator> createState() => _MarkerGeneratorState();
}

class _MarkerGeneratorState extends State<MarkerGenerator> {
  final Map<MarkerId, GlobalKey> _markerKeys = {};

  @override
  void initState() {
    super.initState();
    for (var place in widget.places) {
      _markerKeys[MarkerId(place.name)] = GlobalKey();
    }
    // Đợi sau frame đầu tiên và thêm delay bổ sung để đảm bảo các marker đã hoàn toàn paint.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
          const Duration(milliseconds: 100)); // Tăng delay nếu cần
      await _generateMarkerIcons();
    });
  }

  Future<void> _generateMarkerIcons() async {
    Map<MarkerId, BitmapDescriptor> icons = {};
    for (var place in widget.places) {
      final key = _markerKeys[MarkerId(place.name)];
      if (key?.currentContext != null) {
        try {
          RenderRepaintBoundary boundary =
              key!.currentContext!.findRenderObject() as RenderRepaintBoundary;
          ui.Image image = await boundary.toImage(pixelRatio: 2.75);
          ByteData? byteData =
              await image.toByteData(format: ui.ImageByteFormat.png);
          Uint8List uint8List = byteData!.buffer.asUint8List();
          icons[MarkerId(place.name)] = BitmapDescriptor.fromBytes(uint8List);
        } catch (e) {
          print("Error capturing marker for ${place.name}: $e");
        }
      } else {
        print("GlobalKey not ready for ${place.name}");
      }
    }
    widget.onGenerated(icons);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.places.map((place) {
        return RepaintBoundary(
          key: _markerKeys[MarkerId(place.name)],
          child: MapMarker(price: place.price),
        );
      }).toList(),
    );
  }
}
