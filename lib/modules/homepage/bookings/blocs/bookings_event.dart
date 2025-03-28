abstract class BookingsEvent {}

class SelectBookingTime extends BookingsEvent {
  final int selectedIndex;

  SelectBookingTime(this.selectedIndex);
}

class ResetBookingSelection extends BookingsEvent {}