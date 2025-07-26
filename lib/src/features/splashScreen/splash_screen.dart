import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';

import '../../utils/route_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
       CommonMethods.replaceWithNextScreen(context, RoutesPath.firstOnboardingScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png', width: 200,),
            CommonMethods.appTexts(
              context,
              "... secure inventory control starts here.",
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
