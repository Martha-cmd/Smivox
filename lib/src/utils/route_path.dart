import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/POS/view/empty_pos_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/company_registration_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/forgot_password.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/personal_details.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/reset_password.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/company_login_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/gen_login_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/verifications/check_email_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/verifications/verified.dart';
import 'package:smivox_inventory_software/src/features/bottomBar/bottomBar.dart';
import 'package:smivox_inventory_software/src/features/home/view/home.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/inventory_screen.dart';
import 'package:smivox_inventory_software/src/features/sales/view/sales_screen.dart';
import 'package:smivox_inventory_software/src/features/sales/view/single_sales_screen.dart';
import 'package:smivox_inventory_software/src/features/splashScreen/splash_screen.dart';
import '../features/POS/view/pos_screen.dart';
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
    static const personalDetailsScreen = "/personalDetailsScreen";
    static const companyLoginScreen = "/companyLoginScreen";
    static const genLoginScreen = "/genLoginScreen";
    static const forgotPasswordScreen = "/forgotPasswordScreen";
    static const resetPasswordScreen = "/resetPasswordScreen";
    static const checkYourEmailScreen = "/checkYourEmailScreen";
    static const verifiedScreen = "/verifiedScreen";
    static const bottomBar = "/bottomBar";
    static const homeScreen = "/homeScreen";
    static const posScreen = "/posScreen";
    static const inventoryScreen = "/inventoryScreen";
    static const salesScreen = "/salesScreen";
    static const emptyPOSScreen = "/emptyPOSScreen";
    static const singleSalesScreen = "/singleSalesScreen";


    static Map<String, WidgetBuilder> routes = {
      RoutesPath.splashScreen: (context) => const SplashScreen(),
      RoutesPath.firstOnboardingScreen: (context) => const FirstOnboardingScreen(),
      RoutesPath.secondOnboardingScreen: (context) => const SecondOnboardingScreen(),
      RoutesPath.thirdOnboardingScreen: (context) => const ThirdOnboardingScreen(),
      RoutesPath.companyRegistrationScreen: (context) => const CompanyRegistrationScreen(),
      RoutesPath.personalDetailsScreen: (context) => const PersonalDetailsScreen(),
      RoutesPath.companyLoginScreen: (context) => const CompanyLoginScreen(),
      RoutesPath.genLoginScreen: (context) => const GenLoginScreen(),
      RoutesPath.forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
      RoutesPath.resetPasswordScreen: (context) => const ResetPasswordScreen(),
      RoutesPath.checkYourEmailScreen: (context) => const CheckEmailScreen(),
      RoutesPath.verifiedScreen: (context) => const VerifiedScreen(),
      RoutesPath.bottomBar: (context) => const BottomBar(),
      RoutesPath.homeScreen: (context) => const HomeScreen(),
      RoutesPath.posScreen: (context) => const POS(),
      RoutesPath.inventoryScreen: (context) => const InventoryScreen(),
      RoutesPath.salesScreen: (context) => const SalesScreen(),
      RoutesPath.emptyPOSScreen: (context) => const EmptyPosScreen(),
      RoutesPath.singleSalesScreen: (context) => const SingleSalesScreen(),
    };

    static routesFactory(settings) {
      switch (settings.name) {
        case RoutesPath.splashScreen:
        case RoutesPath.firstOnboardingScreen:
        case RoutesPath.secondOnboardingScreen:
        case RoutesPath.thirdOnboardingScreen:
        case RoutesPath.companyRegistrationScreen:
        case RoutesPath.personalDetailsScreen:
        case RoutesPath.companyLoginScreen:
        case RoutesPath.genLoginScreen:
        case RoutesPath.forgotPasswordScreen:
        case RoutesPath.resetPasswordScreen:
        case RoutesPath.checkYourEmailScreen:
        case RoutesPath.verifiedScreen:
        case RoutesPath.bottomBar:
        case RoutesPath.homeScreen:
        case RoutesPath.posScreen:
        case RoutesPath.inventoryScreen:
        case RoutesPath.salesScreen:
        case RoutesPath.emptyPOSScreen:
        case RoutesPath.singleSalesScreen:
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