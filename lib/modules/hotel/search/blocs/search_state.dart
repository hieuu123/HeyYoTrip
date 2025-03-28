class SearchDateState {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final int nights;
  final String? error;

  SearchDateState({
    this.checkIn,
    this.checkOut, 
    this.nights = 0,
    this.error,
  });

  SearchDateState copyWith({
    DateTime? checkIn,
    DateTime? checkOut,
    int? nights,
    String? error,
  }) {
    return SearchDateState(
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      nights: nights ?? this.nights,
      error: error ?? this.error,
    );
  }
}