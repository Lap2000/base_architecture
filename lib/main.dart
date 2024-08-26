import 'package:flutter/material.dart';
import 'package:test_sample/presentation/routers/router.dart';

import 'package:test_sample/shared/flavor/app_flavor.dart';

import 'utils/utils.dart';

part 'main_config.dart';

Future<void> main() async {
  await _config();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Test',
      routerConfig: appRouter.config(),
      theme: AppTheme.internal().light,
      darkTheme: AppTheme.internal().dark,
    );
  }
}
