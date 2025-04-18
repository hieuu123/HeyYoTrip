part of 'flight_search_bloc.dart';

// Select place
abstract class FlightSearchEvent extends Equatable {
  const FlightSearchEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFromPlaceEvent extends FlightSearchEvent {
  final String place;
  final String code;

  const UpdateFromPlaceEvent({
    required this.place,
    required this.code,
  });

  @override
  List<Object?> get props => [place, code];
}

class UpdateToPlaceEvent extends FlightSearchEvent {
  final String place;
  final String code;

  const UpdateToPlaceEvent({
    required this.place,
    required this.code,
  });

  @override
  List<Object?> get props => [place, code];
}

//Select date
abstract class FlightDateEvent {}

class UpdateFlightDates extends FlightDateEvent {
  final DateTime checkIn;
  final DateTime checkOut;
  final int nights;

  UpdateFlightDates({
    required this.checkIn,
    required this.checkOut,
    required this.nights,
  });
}

class ResetFlightDates extends FlightDateEvent {}

// Select passenger
abstract class SelectPassengerEvent extends Equatable {
  const SelectPassengerEvent();
  @override
  List<Object?> get props => [];
}

class UpdateAdultCount extends SelectPassengerEvent {
  final int count;
  const UpdateAdultCount(this.count);

  @override
  List<Object?> get props => [count];
}

class UpdateChildrenCount extends SelectPassengerEvent {
  final int count;
  const UpdateChildrenCount(this.count);

  @override
  List<Object?> get props => [count];
}

class UpdateInfantCount extends SelectPassengerEvent {
  final int count;
  const UpdateInfantCount(this.count);

  @override
  List<Object?> get props => [count];
}
