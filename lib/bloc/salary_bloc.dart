import 'package:bloc/bloc.dart';
import 'package:flutter_salary_time_bloc_project/constrain.dart';
import 'package:equatable/equatable.dart';

part 'salary_event.dart';
part 'salary_state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(SalaryInitial(salary_now: 0, screen_fps: 20)) {
    on<count_money>((event, emit) async {
      int month = DateTime.now().month;
      int day = DateTime.now().day;
      int? total_day = year22_month_day[month];
      //Month needed working
      int? work = work_day[month];
      double rate_day_money = salary_month / work!;
      // average of work day
      double worked_day = day / total_day! * work - 1;
      //rate of second's money
      double rate_second_money = rate_day_money / (8 * 3600);
      //screen_fps
      int times = 1;
      while (times <= state.screen_fps) {
        //total earned money
        double now_money = rate_day_money * worked_day +
            (event.nowtime - 1 + 1 / state.screen_fps * times) *
                rate_second_money;
        emit(SalaryInitial(
            salary_now: now_money + 3, screen_fps: state.screen_fps));
        await Future.delayed(Duration(milliseconds: 1000 ~/ state.screen_fps));
        times += 1;
      }
    });
    on<change_fps>((event, emit) {
      emit(SalaryInitial(
          salary_now: state.salary_now, screen_fps: event.fpsvalue));
    });
  }
}
