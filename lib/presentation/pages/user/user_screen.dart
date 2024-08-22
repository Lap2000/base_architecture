import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_sample/presentation/routers/router.dart';

@RoutePage()
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'User',
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(RouterPath.settings);
              },
              child: const Text(
                'Go to Settings Page',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.replaceNamed(RouterPath.login);
              },
              child: const Text(
                'Logout',
              ),
            )
          ],
        ),
      ),
    );
  }
}
