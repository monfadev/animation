import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:animation/shared/theme.dart';

import 'pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSplash = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animasi",
      home: _isSplash ? SplashScreen() : MainPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _value = 0.1;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_value >= 1.0) timer.cancel();
      if (mounted)
        setState(() {
          _value = _value + 0.2;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 80,
          child: LiquidLinearProgressIndicator(
            value: _value,
            valueColor: AlwaysStoppedAnimation(blueColor),
            backgroundColor: whiteColor,
            borderColor: whiteColor,
            borderWidth: 1.0,
            borderRadius: 5.0,
            direction: Axis.horizontal,
            center: Text("Loading...", style: TextStyle(color: whiteColor)),
          ),
        ),
      ),
    );
  }
}
