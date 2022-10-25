part of 'count_bloc.dart';

@immutable
abstract class CountEvent extends Equatable {}

class Count_Time extends CountEvent {
  @override
  List<Object?> get props => [];
}

class Count_Increase extends CountEvent {
  @override
  List<Object?> get props => [];
}
