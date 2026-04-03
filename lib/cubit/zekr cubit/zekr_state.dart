sealed class ZekrState {}

class ZekrInitial extends ZekrState {}

class ZekrLoaded extends ZekrState {
  final List<String> adhkar;
  final int currentIndex;
  final int interval;
  ZekrLoaded({
    required this.adhkar,
    required this.currentIndex,
    required this.interval,
  });
}

class ZekrError extends ZekrState {
  final String message;
  ZekrError({required this.message});
}

class ZekrLoading extends ZekrState {}
