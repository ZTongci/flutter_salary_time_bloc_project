import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/salary_bloc.dart';

import '../constrain.dart';

class Slidefps extends StatelessWidget {
  int slidevalue = 20;
  void Function(double)? changvalue;

  Slidefps({required this.slidevalue, required this.changvalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ScreenFPS:${slidevalue}",
          style: timetextstyle,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
            activeTrackColor: Color(0xffEB1555),
            inactiveTickMarkColor: Colors.white,
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x50EB1555),
          ),
          child: Slider(
            value: slidevalue.toDouble(),
            onChanged: changvalue,
            max: 144.0,
            min: 1.0,
          ),
        ),
      ],
    );
  }
}
