import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Colombo, Sri Lanka | LK",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMinute(),
        ],
      ),
    );
  }
}

class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  DateTime _now = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_now.minute != DateTime.now().minute) {
        setState(() {
          _now = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = DateFormat("a").format(_now);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${DateFormat("h").format(_now)}:${DateFormat("mm").format(_now)}",
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            SizedBox(
              width: 5,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                _period,
                style: TextStyle(fontSize: getProportionateScreenWidth(18)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat("yyyy").format(_now),
              style: Theme.of(context).textTheme.headline1,
            ),
            Column(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    DateFormat("MM").format(_now),
                    style: TextStyle(fontSize: getProportionateScreenWidth(25)),
                  ),
                ),
                Text(
                  DateFormat("dd").format(_now),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
