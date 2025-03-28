sealed class CategoryEvent {}

class CategorySelected extends CategoryEvent {
  final int selectedIndex;
  CategorySelected(this.selectedIndex);
}

sealed class BottomNavEvent {}

class BottomNavItemSelected extends BottomNavEvent {
  final int index;
  BottomNavItemSelected(this.index);
}
