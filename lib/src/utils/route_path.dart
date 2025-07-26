import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/authentication/company_registration_screen.dart';
import 'package:smivox_inventory_software/src/features/splashScreen/splash_screen.dart';
import '../features/onboarding/first_onboarding_screen.dart';
import '../features/onboarding/second_onboarding_screen.dart';
import '../features/onboarding/third_onboarding_screen.dart';


class RoutesPath {
    static const initialRoutes = "/";
    static const splashScreen = "/splashScreen";
    static const firstOnboardingScreen = "/firstOnboardingScreen";
    static const secondOnboardingScreen = "/secondOnboardingScreen";
    static const thirdOnboardingScreen = "/thirdOnboardingScreen";
    static const companyRegistrationScreen = "/companyRegistrationScreen";


    static Map<String, WidgetBuilder> routes = {
      RoutesPath.splashScreen: (context) => const SplashScreen(),
      RoutesPath.firstOnboardingScreen: (context) => const FirstOnboardingScreen(),
      RoutesPath.secondOnboardingScreen: (context) => const SecondOnboardingScreen(),
      RoutesPath.thirdOnboardingScreen: (context) => const ThirdOnboardingScreen(),
      RoutesPath.companyRegistrationScreen: (context) => const CompanyRegistrationScreen(),
    };

    static routesFactory(settings) {
      switch (settings.name) {
        case RoutesPath.splashScreen:
        case RoutesPath.firstOnboardingScreen:
        case RoutesPath.secondOnboardingScreen:
        case RoutesPath.thirdOnboardingScreen:
        case RoutesPath.companyRegistrationScreen:
      default:
      return null;
      }}

    // static getPage(var child, var settings) {
    //   var type = PageTransitionType.rightToLeft;
    //
    //   return PageTransition(
    //     child: child,
    //     type: type,
    //     settings: settings,
    //   );
    // }
}