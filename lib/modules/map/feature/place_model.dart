class PlaceModel {
  final String name;
  final int rate;
  final int comment;
  final String price;
  final int passenger;
  final int night;
  final double latitude;
  final double longitude;

  PlaceModel({
    required this.name,
    required this.rate,
    required this.comment,
    required this.price,
    required this.passenger,
    required this.night,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'],
      rate: json['rate'],
      comment: json['comment'],
      price: json['price'],
      passenger: json['passenger'],
      night: json['night'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
