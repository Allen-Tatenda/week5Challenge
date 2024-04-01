import 'dart:async';
import 'package:week5challenge/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../root.dart';
import 'login.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (supabase.auth.currentUser != null) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const RootApp()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const LoginPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.primary,
      child: Container(
        color: const Color(0x00757575),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: ClipRRect(
              //       borderRadius: BorderRadius.circular(8),
              //       child: Image.asset(
              //         'assets/nash2.jpg',
              //         width: 150,
              //         fit: BoxFit.cover,
              //       )),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "FurnitureApp",
                style: TextStyle(
                    fontSize: 24,
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
