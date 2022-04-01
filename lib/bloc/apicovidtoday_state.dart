part of 'apicovidtoday_bloc.dart';

@immutable
abstract class ApicovidtodayState {}

class ApicovidtodayInitial extends ApicovidtodayState {}

class StateLoading extends ApicovidtodayState {
  @override
  String toString() => 'Loading...';
}

class StateError extends ApicovidtodayState {
  final String message;
  StateError({required this.message});
  @override
  String toString() => message;
}

class GetApiStateSuccess extends ApicovidtodayState {
  List<Covid> covids;
  GetApiStateSuccess({required this.covids});
}
