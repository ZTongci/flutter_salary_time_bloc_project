import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(const CountInitial(minutes: 1, hours: 10, seconds: 1)) {
    on<Count_Time>((event, emit) async {
      int second = DateTime.now().second;
      for (int n = second; n <= 60; n++) {
        await Future.delayed(const Duration(seconds: 1));
        emit(CountInitial(
            minutes: DateTime.now().minute,
            hours: DateTime.now().hour,
            seconds: n));
        if (state.seconds == 60) {
          n = 0;
          emit(CountInitial(
              minutes: DateTime.now().minute,
              hours: DateTime.now().hour,
              seconds: n));
        }
        if (state.seconds == 0) {
          n = 1;
          emit(CountInitial(
              minutes: DateTime.now().minute,
              hours: DateTime.now().hour,
              seconds: n));
        }
      }
    });
  }
}
