import 'package:flutter/material.dart';
import 'package:test_sample/presentation/common/base/app_bar/base_app_bar.dart';

class _$BaseScaffold extends Scaffold {
  @override
  PreferredSizeWidget get appBar => const BaseAppBar();
}

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return _$BaseScaffold();
      },
    );
  }
}
