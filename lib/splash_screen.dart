import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remove_bg/Home_page.dart';

class spalsh_screen extends StatefulWidget {
  @override
  State<spalsh_screen> createState() => _spalsh_screenState();
}

class _spalsh_screenState extends State<spalsh_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation after a delay
    Timer(Duration(seconds: 1), () {
      _animationController.forward();
    });

    // Navigate to Home after animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: _animation.value,
          child: Image.asset("lib/Assets/Images/bg22.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
