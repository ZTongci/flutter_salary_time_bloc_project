part of 'salary_bloc.dart';

abstract class SalaryState extends Equatable {
  final double salary_now;
  final int screen_fps;
  const SalaryState({required this.screen_fps, required this.salary_now});

  @override
  List<Object> get props => [salary_now, screen_fps];
}

class SalaryInitial extends SalaryState {
  SalaryInitial({required super.salary_now, required super.screen_fps});
}
