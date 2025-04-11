import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/map/feature/place_model.dart';
import 'package:heyyo_trip/modules/map/widget/map_place_card.dart';

class MapPlaceSection extends StatelessWidget {
  final List<PlaceModel> places;
  final void Function(PlaceModel) onPlaceTap;
  final PlaceModel? selectedPlace;
  final ScrollController scrollController;

  const MapPlaceSection(
      {required this.places,
      required this.onPlaceTap,
      this.selectedPlace,
      required this.scrollController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      final isSelected = selectedPlace?.name == place.name;
                      return GestureDetector(
                        onTap: () => onPlaceTap(place),
                        child: Container(
                          margin: (index < places.length - 1)
                              ? const EdgeInsets.only(right: 10)
                              : null,
                          child: MapPlaceCard(
                            name: place.name,
                            rate: place.rate,
                            comment: place.comment,
                            price: place.price,
                            passenger: place.passenger,
                            night: place.night,
                            isSelected: isSelected,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
