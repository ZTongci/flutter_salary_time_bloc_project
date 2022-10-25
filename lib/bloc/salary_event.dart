part of 'salary_bloc.dart';

abstract class SalaryEvent extends Equatable {}

class count_money extends SalaryEvent {
  double nowtime;
  count_money({required this.nowtime});
  @override
  List<Object> get props => [nowtime];
}

class change_fps extends SalaryEvent {
  final int fpsvalue;
  change_fps({required this.fpsvalue});
  @override
  List<Object> get props => [fpsvalue];
}
