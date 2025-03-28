import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial(0)) {
    on<CategorySelected>((event, emit) {
      emit(CategoryInitial(event.selectedIndex));
    });
  }
}

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial(0)) {
    on<BottomNavItemSelected>((event, emit) {
      emit(BottomNavInitial(event.index));
    });
  }
}
