class BookingsState {
  final int selectedIndex;
  final List<bool> selectedStates;

  BookingsState({
    this.selectedIndex = 0,
    List<bool>? selectedStates,
  }) : selectedStates = selectedStates ?? List.generate(4, (index) => index == 0);

  BookingsState copyWith({
    int? selectedIndex,
    List<bool>? selectedStates,
  }) {
    return BookingsState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedStates: selectedStates ?? this.selectedStates,
    );
  }
}
