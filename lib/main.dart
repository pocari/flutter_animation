import 'package:flutter/animation.dart';
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

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    print("----------------------------------------------------");
    print("init state");
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addListener(() {
            print("----------------------------------------------------");
            print("in lister");
            setState(() {
              print("----------------------------------------------------");
              print("run setState");
            });
          });

    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    print("----------------------------------------------------");
    print("dispose");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("----------------------------------------------------");
    print("build");
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
