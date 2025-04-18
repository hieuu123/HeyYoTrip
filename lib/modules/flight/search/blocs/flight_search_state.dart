part of 'flight_search_bloc.dart';

// Select place
abstract class FlightSearchState extends Equatable {
  const FlightSearchState();

  @override
  List<Object?> get props => [];
}

class FlightSearchInitial extends FlightSearchState {}

class FlightSearchLoaded extends FlightSearchState {
  final String? fromPlace;
  final String? toPlace;
  final String? fromCode;
  final String? toCode;

  const FlightSearchLoaded({
    this.fromPlace,
    this.toPlace,
    this.fromCode,
    this.toCode,
  });

  FlightSearchLoaded copyWith({
    String? fromPlace,
    String? toPlace,
    String? fromCode,
    String? toCode,
  }) {
    return FlightSearchLoaded(
      fromPlace: fromPlace ?? this.fromPlace,
      toPlace: toPlace ?? this.toPlace,
      fromCode: fromCode ?? this.fromCode,
      toCode: toCode ?? this.toCode,
    );
  }

  @override
  List<Object?> get props => [fromPlace, toPlace, fromCode, toCode];
}

// Select date
class FlightDateState {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final int nights;
  final String? error;

  FlightDateState({
    this.checkIn,
    this.checkOut,
    this.nights = 0,
    this.error,
  });

  FlightDateState copyWith({
    DateTime? checkIn,
    DateTime? checkOut,
    int? nights,
    String? error,
  }) {
    return FlightDateState(
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      nights: nights ?? this.nights,
      error: error ?? this.error,
    );
  }
}

// Select passenger
class SelectPassengerState extends Equatable {
  final int adult;
  final int children;
  final int infant;

  const SelectPassengerState({
    required this.adult,
    required this.children,
    required this.infant,
  });

  SelectPassengerState copyWith({
    int? adult,
    int? children,
    int? infant,
  }) {
    return SelectPassengerState(
      adult: adult ?? this.adult,
      children: children ?? this.children,
      infant: infant ?? this.infant,
    );
  }

  @override
  List<Object?> get props => [adult, children, infant];
}
