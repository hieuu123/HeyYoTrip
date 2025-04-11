import 'package:dio/dio.dart';
import 'place_model.dart';

class PlaceService {
  static Future<List<PlaceModel>> fetchPlaces() async {
    final response =
        await Dio().get('https://67f722db42d6c71cca64227d.mockapi.io/places');
    return (response.data as List)
        .map((json) => PlaceModel.fromJson(json))
        .toList();
  }
}
