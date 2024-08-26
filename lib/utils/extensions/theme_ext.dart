import 'package:flutter/material.dart';
import 'package:test_sample/utils/utils.dart';

extension ThemeExt on ThemeData {
  AppColors get colors {
    return extension<AppColors>()!;
  }

  AppTextStyle get styles {
    return extension<AppTextStyle>()!;
  }
}

extension BuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppTextStyle get styles => Theme.of(this).styles;

  AppColors get colors => Theme.of(this).colors;
}
