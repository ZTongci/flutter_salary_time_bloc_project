import 'package:flutter_salary_time_bloc_project/bloc/count_bloc.dart';
import 'package:flutter_salary_time_bloc_project/bloc/salary_bloc.dart';
import 'package:flutter_salary_time_bloc_project/constrain.dart';
import 'package:flutter_salary_time_bloc_project/widget/boxwidget.dart';
import 'package:flutter_salary_time_bloc_project/widget/sildewidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountBloc>(
          create: (context) => CountBloc(),
        ),
        BlocProvider<SalaryBloc>(
          create: (context) => SalaryBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: '💰Bloc Work Salary'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String second_rest() {
    if (60 - context.read<CountBloc>().state.seconds < 10) {
      return "0${60 - context.read<CountBloc>().state.seconds}";
    } else {
      return "${60 - context.read<CountBloc>().state.seconds}";
    }
  }

  String second_now() {
    if (context.read<CountBloc>().state.seconds < 10) {
      return "0${context.read<CountBloc>().state.seconds}";
    } else {
      return "${context.read<CountBloc>().state.seconds}";
    }
  }

  String minute_rest() {
    if (60 - context.read<CountBloc>().state.minutes < 10) {
      return "0${60 - context.read<CountBloc>().state.minutes}";
    } else {
      return "${60 - context.read<CountBloc>().state.minutes}";
    }
  }

  String minute_now() {
    if (context.read<CountBloc>().state.minutes < 10) {
      return "0${context.read<CountBloc>().state.minutes}";
    } else {
      return "${context.read<CountBloc>().state.minutes}";
    }
  }

  String hour_now() {
    if (context.read<CountBloc>().state.hours < 10) {
      return "0${context.read<CountBloc>().state.hours}";
    } else {
      return "${context.read<CountBloc>().state.hours}";
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CountBloc>().add(Count_Time());
  }

  //controll bloc build times
  int bloc_build_times = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 4, 0, 26),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CountBloc, CountState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                work_salary_text(
                  textcontent: Text(
                      "現在 ${hour_now()} : ${minute_now()} : ${second_now()}",
                      style: timetextstyle),
                ),
                work_salary_text(
                  textcontent: Text(
                      "残り 0${(17 - context.read<CountBloc>().state.hours)} : ${minute_rest()} : ${second_rest()} ",
                      style: timetextstyle),
                ),
                BlocBuilder<SalaryBloc, SalaryState>(
                  builder: (context, state) {
                    // rest of work time in count salary
                    if (bloc_build_times !=
                        context.read<CountBloc>().state.seconds) {
                      context.read<SalaryBloc>().add(count_money(
                          nowtime: ((8 -
                                          (18 -
                                              context
                                                  .read<CountBloc>()
                                                  .state
                                                  .hours)) *
                                      3600 +
                                  (context.read<CountBloc>().state.minutes) *
                                      60 +
                                  context.read<CountBloc>().state.seconds)
                              .toDouble()));
                      print(
                          ((8 - (18 - context.read<CountBloc>().state.hours)) *
                                  3600 +
                              (context.read<CountBloc>().state.minutes) * 60 +
                              context.read<CountBloc>().state.seconds));
                      bloc_build_times =
                          context.read<CountBloc>().state.seconds;
                    }
                    return work_salary_text(
                      textcontent: Text(
                          "稼ぎ ${(context.read<SalaryBloc>().state.salary_now * 10000).toStringAsFixed(5)} ￥",
                          style: timetextstyle),
                    );
                  },
                ),
                BlocBuilder<SalaryBloc, SalaryState>(
                  builder: (context, state) {
                    return Slidefps(
                      slidevalue: context.read<SalaryBloc>().state.screen_fps,
                      changvalue: (double value) {
                        context
                            .read<SalaryBloc>()
                            .add(change_fps(fpsvalue: value.toInt()));
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
