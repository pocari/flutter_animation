import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogoApp());
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 300,
            width: 300,
            child: FlutterLogo(),
          ),
        ),
      );
}
