import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/features/POS/view/empty_pos_screen.dart';
import 'package:smivox_inventory_software/src/features/SUPERVISOR/screens/bottomBar/bottomBar.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/register/store_registration_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/forgot_password.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/register/personal_details.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/reset_password.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/store_login_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/signIn/gen_login_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/verifications/check_email_screen.dart';
import 'package:smivox_inventory_software/src/features/authentication/view/verifications/verified.dart';
import 'package:smivox_inventory_software/src/features/bottomBar/bottomBar.dart';
import 'package:smivox_inventory_software/src/features/customer/view/customer_view.dart';
import 'package:smivox_inventory_software/src/features/home/view/home.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/category_view.dart';
import 'package:smivox_inventory_software/src/features/inventory/view/inventory_screen.dart';
import 'package:smivox_inventory_software/src/features/notification/view/notification_view.dart';
import 'package:smivox_inventory_software/src/features/reports/view/inventory_reports/view/inventory_summary_report.dart';
import 'package:smivox_inventory_software/src/features/reports/view/reports_view.dart';
import 'package:smivox_inventory_software/src/features/reports/view/sales_reports/return_history_summary.dart';
import 'package:smivox_inventory_software/src/features/reports/view/sales_reports/sales_by_customer.dart';
import 'package:smivox_inventory_software/src/features/reports/view/sales_reports/sales_by_products.dart';
import 'package:smivox_inventory_software/src/features/reports/view/sales_reports/sales_by_staff.dart';
import 'package:smivox_inventory_software/src/features/reports/view/tamper_attempts_report/view/tamper_summary_view.dart';
import 'package:smivox_inventory_software/src/features/sales/view/sales_screen.dart';
import 'package:smivox_inventory_software/src/features/sales/view/single_sales_screen.dart';
import 'package:smivox_inventory_software/src/features/settings/view/change_password.dart';
import 'package:smivox_inventory_software/src/features/settings/view/personal_settings.dart';
import 'package:smivox_inventory_software/src/features/settings/view/store_settings.dart';
import 'package:smivox_inventory_software/src/features/splashScreen/splash_screen.dart';
import '../features/POS/view/pos_screen.dart';
import '../features/onboarding/first_onboarding_screen.dart';
import '../features/onboarding/second_onboarding_screen.dart';
import '../features/onboarding/third_onboarding_screen.dart';
import '../features/staff/view/staff_view.dart';


class RoutesPath {
    static const initialRoutes = "/";
    static const splashScreen = "/splashScreen";
    static const firstOnboardingScreen = "/firstOnboardingScreen";
    static const secondOnboardingScreen = "/secondOnboardingScreen";
    static const thirdOnboardingScreen = "/thirdOnboardingScreen";
    static const storeRegistrationScreen = "/storeRegistrationScreen";
    static const personalDetailsScreen = "/personalDetailsScreen";
    static const storeLoginScreen = "/storeLoginScreen";
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
    static const customerView = "/customerView";
    static const staffView = "/staffView";
    static const storeSettings = "/storeSettings";
    static const personalSettings = "/personalSettings";
    static const changePassword = "/changePassword";
    static const reportsView = "/reportsView";
    static const salesByCustomer = "/salesByCustomer";
    static const salesByStaff = "/salesByStaff";
    static const salesByProducts = "/salesByProducts";
    static const returnHistorySummary = "/returnHistorySummary";
    static const inventorySummaryReport = "/inventorySummaryReport";
    static const tamperSummaryReport = "/tamperSummaryReport";
    static const categoryView = "/categoryView";
    static const notificationView = "/notificationView";

    /// SuperVisor Screens
    static const supervisorBottomBarView = "/superVisorHomeView";



    static Map<String, WidgetBuilder> routes = {
      RoutesPath.splashScreen: (context) => const SplashScreen(),
      RoutesPath.firstOnboardingScreen: (context) => const FirstOnboardingScreen(),
      RoutesPath.secondOnboardingScreen: (context) => const SecondOnboardingScreen(),
      RoutesPath.thirdOnboardingScreen: (context) => const ThirdOnboardingScreen(),
      RoutesPath.storeRegistrationScreen: (context) => const StoreRegistrationScreen(),
      RoutesPath.personalDetailsScreen: (context) => const PersonalDetailsScreen(),
      RoutesPath.storeLoginScreen: (context) => const StoreLoginScreen(),
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
      RoutesPath.customerView: (context) => const CustomerView(),
      RoutesPath.staffView: (context) => const StaffView(),
      RoutesPath.storeSettings: (context) => const StoreSettings(),
      RoutesPath.personalSettings: (context) => const PersonalSettings(),
      RoutesPath.changePassword: (context) => const ChangePassword(),
      RoutesPath.reportsView: (context) => const ReportsView(),
      RoutesPath.salesByCustomer: (context) => const SalesByCustomer(),
      RoutesPath.salesByProducts: (context) => const SalesByProducts(),
      RoutesPath.salesByStaff: (context) => const SalesByStaff(),
      RoutesPath.returnHistorySummary: (context) => const ReturnHistorySummary(),
      RoutesPath.inventorySummaryReport: (context) => const InventorySummaryReport(),
      RoutesPath.tamperSummaryReport: (context) => const TamperSummaryView(),
      RoutesPath.categoryView: (context) => const CategoryView(),
      RoutesPath.notificationView: (context) => const NotificationView(),
      RoutesPath.supervisorBottomBarView: (context) => const SupervisorBottomBar(),
    };

    static routesFactory(settings) {
      switch (settings.name) {
        case RoutesPath.splashScreen:
        case RoutesPath.firstOnboardingScreen:
        case RoutesPath.secondOnboardingScreen:
        case RoutesPath.thirdOnboardingScreen:
        case RoutesPath.storeRegistrationScreen:
        case RoutesPath.personalDetailsScreen:
        case RoutesPath.storeLoginScreen:
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
        case RoutesPath.customerView:
        case RoutesPath.staffView:
        case RoutesPath.storeSettings:
        case RoutesPath.personalSettings:
        case RoutesPath.changePassword:
        case RoutesPath.reportsView:
        case RoutesPath.salesByCustomer:
        case RoutesPath.salesByProducts:
        case RoutesPath.salesByStaff:
        case RoutesPath.returnHistorySummary:
        case RoutesPath.inventorySummaryReport:
        case RoutesPath.tamperSummaryReport:
        case RoutesPath.categoryView:
        case RoutesPath.notificationView:
        case RoutesPath.supervisorBottomBarView:
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