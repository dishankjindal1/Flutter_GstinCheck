import 'package:flutter/material.dart';

Widget sliderButtonWidget(BuildContext context, bool boolValue) {
  double width = MediaQuery.of(context).size.width - 60;
  bool _alignment = boolValue;

  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green[500], borderRadius: BorderRadius.circular(50)),
        child: null,
      ),
      AnimatedAlign(
        alignment: _alignment ? Alignment(-1.0, 0.0) : Alignment(1.0, 0.0),
        duration: Duration(
          milliseconds: 250,
        ),
        curve: Curves.linear,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: null,
            width: width / 2,
            height: 42,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
      Align(
        alignment: Alignment(-1.0, 0.0),
        child: Container(
          alignment: Alignment.center,
          width: width / 2,
          height: 42,
          child: Text(
            'Search GST Number',
            style: TextStyle(color: _alignment ? Colors.black : Colors.white),
          ),
        ),
      ),
      Align(
        alignment: Alignment(1.0, 0.0),
        child: Container(
          alignment: Alignment.center,
          width: width / 2,
          height: 31,
          child: Text(
            'GST Return Status',
            style: TextStyle(color: _alignment ? Colors.white : Colors.black),
          ),
        ),
      ),
    ],
  );
}
