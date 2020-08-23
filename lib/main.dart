import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var fate = 1;
  void change_fate() {
    setState(() {
      fate = Random().nextInt(5) + 1;
    });
  }

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      change_fate();
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed: (){
            change_fate();
          },
          child: Image.asset("images/ball$fate.png"),
        ),
      ),
    );
  }
}
