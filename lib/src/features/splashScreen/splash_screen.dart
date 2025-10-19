import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import '../../core/storage/storage_manager.dart';
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
       _navigateToNextScreen();
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

  void _navigateToNextScreen() {
    final hasSeenOnboarding = StorageManager.getHasSeenOnboarding();
    final currentStep = StorageManager.getCurrentStep();

    if (hasSeenOnboarding == false) {
      CommonMethods.replaceWithNextScreen(context, RoutesPath.firstOnboardingScreen);
      return;
    }

    // Returning user - check where they left off
    switch (currentStep) {
      case '/store-registration':
        CommonMethods.replaceWithNextScreen(context, RoutesPath.storeRegistrationScreen);
        break;
      case '/personal-details':
        CommonMethods.replaceWithNextScreen(context, RoutesPath.personalDetailsScreen);
        break;
      case '/dashboard':
        CommonMethods.replaceWithNextScreen(context, RoutesPath.bottomBar);
        break;
      case '/login':
        CommonMethods.replaceWithNextScreen(context, RoutesPath.storeLoginScreen);
        break;
      case '/genLogin':
        CommonMethods.replaceWithNextScreen(context, RoutesPath.genLoginScreen);
        break;
      default:
      // If no current step is set, default to store registration
        CommonMethods.replaceWithNextScreen(context, RoutesPath.storeRegistrationScreen);
    }
  }
}
