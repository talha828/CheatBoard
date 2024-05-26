import 'dart:async';

import 'package:bard_flutter/generated/assets.dart';
import 'package:bard_flutter/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () => Get.to(const MainScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            Assets.assetsCube,
            scale: 4,
          ),
        ),
      ),
    );
  }
}
