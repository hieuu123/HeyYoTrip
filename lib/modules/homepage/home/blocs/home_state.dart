// import 'package:equatable/equatable.dart';

class CategoryState{}

class CategoryInitial extends CategoryState {
  final int selectedIndex;

  CategoryInitial(this.selectedIndex);
}

class BottomNavState {}

class BottomNavInitial extends BottomNavState {
  final int selectedIndex;
  BottomNavInitial(this.selectedIndex);
}
