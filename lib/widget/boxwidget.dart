import 'package:flutter/material.dart';

class work_salary_text extends StatelessWidget {
  final Text textcontent;

  work_salary_text({required this.textcontent});

// "現時間　${hour_now()} : ${minute_now()} : ${second_now()}",
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 20, 20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 80, 0, 0), //色
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Center(child: textcontent)),
      ),
    );
  }
}
