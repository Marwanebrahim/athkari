sealed class ZekrState {}

class ZekrInitial extends ZekrState {}

class ZekrLoaded extends ZekrState {
  final List<String> adhkar;
  final int currentIndex;
  ZekrLoaded({required this.adhkar, required this.currentIndex});
}

class ZekrError extends ZekrState {
  final String message;
  ZekrError({required this.message});
}

class ZekrLoading extends ZekrState {}
