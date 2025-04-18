import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_event.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_state.dart';
// import 'package:intl/intl.dart';

class SearchDateBloc extends Bloc<SearchDateEvent, SearchDateState> {
  SearchDateBloc() : super(SearchDateState()) {
    on<UpdateSearchDates>(_onUpdateSearchDates);
    on<ResetSearchDates>(_onResetSearchDates);
  }

  void _onUpdateSearchDates(
    UpdateSearchDates event,
    Emitter<SearchDateState> emit,
  ) {
    emit(state.copyWith(
      checkIn: event.checkIn,
      checkOut: event.checkOut,
      nights: event.nights,
      error: null,
    ));
  }

  void _onResetSearchDates(
    ResetSearchDates event,
    Emitter<SearchDateState> emit,
  ) {
    emit(SearchDateState());
  }
}
