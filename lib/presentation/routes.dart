import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/journey/bottom_sheets/second_bottom_sheet_content.dart';
import 'package:poc_bottom_sheet_route/presentation/journey/dashboard/dashboard_screen.dart';

import 'journey/bottom_sheets/drawer_route.dart';
import 'journey/bottom_sheets/first_bottom_sheet_content.dart';
import 'journey/home/home_screen.dart';
import 'journey/login/login_screen.dart';

abstract class Routes {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const initial = login;

  static Map<String, WidgetBuilder> all = {
    home: (_) => const HomeScreen(),
    login: (_) => const LoginScreen(),
    dashboard: (_) => const DashboardScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final routeName = settings.name ?? '';
    // if (all.containsKey(routeName)) {
    //   return MaterialPageRoute(
    //     builder: all[routeName]!,
    //     settings: settings,
    //   );
    // }
    return BottomSheetRoutes.all(settings);
  }
}

abstract class BottomSheetRoutes {
  static const first = 'first';
  static const second = 'second';

  static Route<dynamic>? all(RouteSettings settings) {
    switch (settings.name) {
      case first:
        return DrawerRoute(
          isScrollControlled: true,
          settings: settings,
          child: const FirstBottomSheetContent(),
        );
      case second:
        return DrawerRoute(
          isScrollControlled: false,
          settings: settings,
          child: const SecondBottomSheetContent(),
        );

      default:
    }
    return null;
  }
}
