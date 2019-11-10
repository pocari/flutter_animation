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

  @override
  void initState() {
    print("----------------------------------------------------");
    print("init state");
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addStatusListener(_onAnimationStatusChanged);

    controller.forward();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        print("----------------------------------------------------");
        print("completed");
        controller.reverse();
        break;
      case AnimationStatus.dismissed:
        print("----------------------------------------------------");
        print("dismissed");
        controller.forward();
        break;
      default:
      // no op
    }
  }

  @override
  void dispose() {
    print("----------------------------------------------------");
    print("dispose");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      GrowTransition(animation: controller, child: LogoWidget());
}

class GrowTransition extends StatelessWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  final Widget child;
  final Animation<double> animation;

  GrowTransition({Key key, this.child, this.animation})
      : assert(child != null),
        assert(animation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print("----------------------------------------------------");
    print("build");

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            print("opacity: ${_opacityTween.evaluate(animation)}");
            print("size: ${_sizeTween.evaluate(animation)}");
            return Opacity(
                opacity: _opacityTween.evaluate(animation),
                child: Container(
                  height: _sizeTween.evaluate(animation),
                  width: _sizeTween.evaluate(animation),
                  child: child,
                ));
          },
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}
