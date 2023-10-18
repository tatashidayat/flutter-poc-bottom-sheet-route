import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/routes.dart';

class FirstBottomSheetContent extends StatelessWidget {
  const FirstBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[RENDER] $runtimeType');
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            runtimeType.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(BottomSheetRoutes.second);
            },
            child: const Text('Second'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Pop'),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Text('List item $index');
            },
          ),
        ],
      ),
    );
  }
}
