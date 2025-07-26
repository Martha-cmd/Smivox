import 'package:flutter/material.dart';
import 'package:smivox_inventory_software/src/commons/app_colors.dart';
import 'package:smivox_inventory_software/src/features/splashScreen/splash_screen.dart';
import 'package:smivox_inventory_software/src/res/theme/theme.dart';
import 'package:smivox_inventory_software/src/utils/route_path.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smivox',
      theme: AppTheme.getLightTheme(context),
      darkTheme: AppTheme.getDarkTheme(context),
      initialRoute: RoutesPath.splashScreen,
      routes: RoutesPath.routes,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}