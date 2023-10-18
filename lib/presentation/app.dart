import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      routes: Routes.all,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      navigatorObservers: [
        MyRouteObserver(),
      ],
    );
  }
}

class MyRouteObserver extends RouteObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('>>> Did pop from ${route.settings.name} '
        'to ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('>>> Did push from ${previousRoute?.settings.name} '
        'to ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint('>>> Did remove from ${previousRoute?.settings.name} '
        'to ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint('>>> Did replace from ${oldRoute?.settings.name} '
        'to ${newRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    debugPrint('>>> Did user gesture on ${route.settings.name}');
  }
}
