import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_sample/presentation/routers/router.dart';
import 'package:test_sample/utils/util.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Login'),
            10.h,
            ElevatedButton(
              onPressed: () {
                context.router.replaceNamed(RouterPath.dashboard);
              },
              child: const Text(
                'Go to Home',
              ),
            )
          ],
        ),
      ),
    );
  }
}
