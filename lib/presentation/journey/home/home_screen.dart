import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is $runtimeType'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(BottomSheetRoutes.first);
                },
                child: const Text('Show BottomSheetRoute'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
