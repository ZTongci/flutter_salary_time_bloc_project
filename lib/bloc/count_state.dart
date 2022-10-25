part of 'count_bloc.dart';

@immutable
abstract class CountState extends Equatable {
  final int minutes;
  final int hours;
  final int seconds;

  const CountState(
      {required this.minutes, required this.hours, required this.seconds});
  @override
  List<Object?> get props => [minutes, hours, seconds];
}

class CountInitial extends CountState {
  const CountInitial(
      {required super.minutes, required super.hours, required super.seconds});
}
