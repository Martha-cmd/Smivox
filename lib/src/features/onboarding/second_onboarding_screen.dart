import 'package:flutter/material.dart';
import '../../commons/common_methods.dart';
import '../../utils/route_path.dart';
import 'components/onboarding_component.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const SecondOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnboardingComponent(
          action: () => CommonMethods.replaceWithNextScreen(context, RoutesPath.storeRegistrationScreen),
          image: 'assets/onboarding/logistics.png',
          headText: "The right way to grow your business",
          subText: "Grow your business, not losses, Smivox secures your inventory.",
          currentIndex: 1,
          totalPages: 3,
          onTap: () => CommonMethods.sendToNextScreen(context, "/thirdOnboardingScreen"),
        ),
      ),
    );
  }
}