abstract class MyEvent {}

abstract class MyState {}

class StateInitialized extends MyState {
  @override
  String toString() => 'init...';
}

class StateLoading extends MyState {
  @override
  String toString() => 'Loading...';
}

class StateError extends MyState {
  final String message;
  StateError({required this.message});

  @override
  String toString() => message;
}
