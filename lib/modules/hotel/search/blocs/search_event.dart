abstract class SearchDateEvent {}

class UpdateSearchDates extends SearchDateEvent {
  final DateTime checkIn;
  final DateTime checkOut;
  final int nights;

  UpdateSearchDates({
    required this.checkIn, 
    required this.checkOut,
    required this.nights,
  });
}

class ResetSearchDates extends SearchDateEvent {}