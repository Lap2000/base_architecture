import 'package:flutter/services.dart';
import 'package:test_sample/shared/constant/app_constant.dart';

enum AppFlavor { dev, stg, pro }

class Flavor {
  Flavor._();
  AppFlavor flavor = AppFlavor.dev;

  Future<void> getNativeFlavor() async {
    MethodChannel channel = MethodChannel(AppConstant.channel);
    await channel.invokeMethod("getFlavor").then((result) {
      flavor = result.toString().flavor;
    });
  }

  static final instance = Flavor._();
}

extension on String {
  AppFlavor get flavor {
    return switch (this) {
      'dev' => AppFlavor.dev,
      'stg' => AppFlavor.stg,
      'pro' => AppFlavor.pro,
      _ => AppFlavor.dev,
    };
  }
}
