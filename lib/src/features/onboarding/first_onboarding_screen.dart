import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import '../../utils/route_path.dart';
import 'components/onboarding_component.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const FirstOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnboardingComponent(
          action: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.storeRegistrationScreen),
          image: 'assets/onboarding/working.png',
          headText: "All you need for your business",
          subText: "You can organize everything about your business with Smivox",
          currentIndex: 0,
          totalPages: 3,
          onTap: () => CommonMethods.sendToNextScreen(context, "/secondOnboardingScreen"),
        ),
      ),
    );
  }
}

