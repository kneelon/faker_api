part of 'fetch_person_cubit.dart';

abstract class FetchPersonState extends Equatable {
  const FetchPersonState();
}

class FetchPersonInitial extends FetchPersonState {
  @override
  List<Object> get props => [];
}

class FetchPersonLoading extends FetchPersonState {
  @override
  List<Object> get props => [];
}

class FetchPersonSuccess extends FetchPersonState {
  final List<DatumEntity> persons;

  const FetchPersonSuccess({required this.persons});

  @override
  List<Object> get props => [persons];
}

class FetchPersonFailure extends FetchPersonState {
  @override
  List<Object> get props => [];
}
