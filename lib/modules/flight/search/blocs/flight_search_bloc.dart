import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'flight_search_event.dart';
part 'flight_search_state.dart';

// Select place
class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {
  FlightSearchBloc()
      : super(const FlightSearchLoaded(
            fromCode: 'SGN',
            fromPlace: 'Ho Chi Minh',
            toCode: 'HAN',
            toPlace: 'Hanoi')) {
    on<UpdateFromPlaceEvent>(_onUpdateFromPlace);
    on<UpdateToPlaceEvent>(_onUpdateToPlace);
  }

  void _onUpdateFromPlace(
    UpdateFromPlaceEvent event,
    Emitter<FlightSearchState> emit,
  ) {
    if (state is FlightSearchLoaded) {
      final currentState = state as FlightSearchLoaded;
      emit(currentState.copyWith(
        fromPlace: event.place,
        fromCode: event.code,
      ));
    } else {
      emit(FlightSearchLoaded(
        fromPlace: event.place,
        fromCode: event.code,
      ));
    }
  }

  void _onUpdateToPlace(
    UpdateToPlaceEvent event,
    Emitter<FlightSearchState> emit,
  ) {
    if (state is FlightSearchLoaded) {
      final currentState = state as FlightSearchLoaded;
      emit(currentState.copyWith(
        toPlace: event.place,
        toCode: event.code,
      ));
    } else {
      emit(FlightSearchLoaded(
        toPlace: event.place,
        toCode: event.code,
      ));
    }
  }
}

// Select date
class FlightDateBloc extends Bloc<FlightDateEvent, FlightDateState> {
  FlightDateBloc() : super(FlightDateState()) {
    on<UpdateFlightDates>(_onUpdateSearchDates);
    on<ResetFlightDates>(_onResetSearchDates);
  }

  void _onUpdateSearchDates(
    UpdateFlightDates event,
    Emitter<FlightDateState> emit,
  ) {
    emit(state.copyWith(
      checkIn: event.checkIn,
      checkOut: event.checkOut,
      nights: event.nights,
      error: null,
    ));
  }

  void _onResetSearchDates(
    ResetFlightDates event,
    Emitter<FlightDateState> emit,
  ) {
    emit(FlightDateState());
  }
}

// Select passenger
class SelectPassengerBloc
    extends Bloc<SelectPassengerEvent, SelectPassengerState> {
  SelectPassengerBloc()
      : super(const SelectPassengerState(adult: 2, children: 0, infant: 0)) {
    on<UpdateAdultCount>(
        (event, emit) => emit(state.copyWith(adult: event.count)));
    on<UpdateChildrenCount>(
        (event, emit) => emit(state.copyWith(children: event.count)));
    on<UpdateInfantCount>(
        (event, emit) => emit(state.copyWith(infant: event.count)));
  }
}
