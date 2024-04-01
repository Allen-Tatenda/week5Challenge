import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0, -3.25), // Move upwards by 25% of screen height
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value * 2 * pi, // Rotate 360 degrees
              child: SlideTransition(
                position: _positionAnimation,
                child: Image.asset(
                  'assets/bluglowtrans.png',
                  width: 100,
                ), // Replace with your logo path
              ),
            );
          },
        ),
      ),
    );
  }
}
