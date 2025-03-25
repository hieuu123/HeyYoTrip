import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/bookings/blocs/bookings_event.dart';
import 'package:heyyo_trip/modules/bookings/blocs/bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsState()) {
    on<SelectBookingTime>(_onSelectBookingTime);
    on<ResetBookingSelection>(_onResetBookingSelection);
  }

  void _onSelectBookingTime(
    SelectBookingTime event,
    Emitter<BookingsState> emit,
  ) {
    final newSelectedStates = List<bool>.filled(4, false);
    newSelectedStates[event.selectedIndex] = true;

    emit(state.copyWith(
      selectedIndex: event.selectedIndex,
      selectedStates: newSelectedStates,
    ));
  }

  void _onResetBookingSelection(
    ResetBookingSelection event,
    Emitter<BookingsState> emit,
  ) {
    emit(BookingsState());
  }
}