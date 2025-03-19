import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/hot_deals/blocs/hot_deals_event.dart';
import 'package:heyyo_trip/modules/hot_deals/blocs/hot_deals_state.dart';

class HotDealsCategoryBloc extends Bloc<HotDealsCategoryEvent, HotDealsCategoryState> {
  HotDealsCategoryBloc() : super(HotDealsCategoryInitial(0)) {
    on<HotDealsCategorySelected>((event, emit) {
      emit(HotDealsCategoryInitial(event.index));
    });
  }
}