import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_sample/utils/util.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const BackButton(),
        centerTitle: true,
      ),
      bottomNavigationBar: const SizedBox.shrink(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
              style: 30.normal(context, Colors.amber),
            ),
            Container(
              width: 50,
              height: 50,
              color: context.colors.wblinear,
            ),
          ],
        ),
      ),
    );
  }
}
