sealed class ZekrState {}

class ZekrInitial extends ZekrState {}

class ZekrLoaded extends ZekrState {
  final List<String> adhkar;
  ZekrLoaded({required this.adhkar});
}

class ZekrError extends ZekrState {
  final String message;
  ZekrError({required this.message});
}

class ZekrLoading extends ZekrState {}
