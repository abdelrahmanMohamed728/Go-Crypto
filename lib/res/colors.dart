import 'package:flutter/material.dart';

const backgroundStyle = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black,
      Color(backgroundColor),
    ],
  ),
);

const backgroundColor = 0xff38253c;