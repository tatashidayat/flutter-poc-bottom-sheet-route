import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/journey/bottom_sheets/drawer_route.dart';
import 'package:poc_bottom_sheet_route/presentation/routes.dart';

class SecondBottomSheetContent extends StatelessWidget {
  const SecondBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          runtimeType.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.dashboard);
          },
          child: const Text('Go To Dashboard'),
        ),
        ElevatedButton(
          onPressed: () {
            DrawerRoute.close();
          },
          child: const Text('Pop Current Sheet'),
        ),
        ElevatedButton(
          onPressed: () {
            DrawerRoute.closeAll();
          },
          child: const Text('Pop All Sheet'),
        ),
        ElevatedButton(
          onPressed: () {
            final navigator = Navigator.of(context);
            DrawerRoute.closeAll();
            navigator.pop();
          },
          child: const Text('Pop Sheet and modal'),
        ),
        // ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return Text('List item $index');
        //   },
        // ),
      ],
    );
  }
}
