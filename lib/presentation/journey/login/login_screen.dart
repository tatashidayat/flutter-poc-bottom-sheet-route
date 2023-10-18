import 'package:flutter/material.dart';
import 'package:poc_bottom_sheet_route/presentation/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  Navigator.of(context).pushNamed(Routes.home);
                },
                child: const Text('Go to Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
