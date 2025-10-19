import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/common_methods.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';
import 'components/onboarding_component.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const ThirdOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnboardingComponent(
          skipOr: "Back",
          action: () {Navigator.pop(context);},
          image: 'assets/onboarding/mobile_business.png',
          spaceBtwImg: 100,
          headText: "Everything about your business in your pocket",
          subText: "From sales to audits, Smivox keeps your business in your pocket",
          currentIndex: 2,
          totalPages: 3,
          btnText: "Get Started",
          onTap: () async {
            await StorageManager.setHasSeenOnboarding(true);
            await StorageManager.setCurrentStep('/store-registration');
            CommonMethods.replaceWithNextScreen(context, RoutesPath.storeRegistrationScreen);
          },
          hasIcon: false,
        ),
      ),
    );
  }
}