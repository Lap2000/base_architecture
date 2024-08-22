import 'package:flutter/material.dart';
import 'package:test_sample/common/gen/colors.gen.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.white,
    required this.black,
    required this.wblinear,
  });

  final Color white;
  final Color black;
  final Color wblinear;

  factory AppColors.light() => AppColors._(
        white: ColorName.white,
        black: ColorName.black,
        wblinear: Color.lerp(ColorName.white, ColorName.black, 0.5)!,
      );

  factory AppColors.dark() => AppColors._(
        white: ColorName.white,
        black: ColorName.black,
        wblinear: Color.lerp(ColorName.white, ColorName.black, 0.5)!,
      );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? white,
    Color? black,
  }) {
    return AppColors._(
      white: white ?? this.white,
      black: black ?? this.black,
      wblinear: wblinear,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors._(
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      wblinear: Color.lerp(wblinear, other.wblinear, t)!,
    );
  }
}

const _baseTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.normal,
);

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  const AppTextStyle._({
    required this.normal,
    required this.bold,
  });

  final TextStyle normal;
  final TextStyle bold;

  factory AppTextStyle.internal() => AppTextStyle._(
        normal: _baseTextStyle,
        bold: _baseTextStyle.copyWith(fontWeight: FontWeight.bold),
      );

  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? normal,
    TextStyle? bold,
  }) {
    return AppTextStyle._(
      normal: normal ?? this.normal,
      bold: bold ?? this.bold,
    );
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
      covariant ThemeExtension<AppTextStyle>? other, double t) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle._(
      normal: TextStyle.lerp(normal, other.normal, t)!,
      bold: TextStyle.lerp(bold, other.bold, t)!,
    );
  }
}

class AppTheme {
  AppTheme.internal();

  ThemeData get _light => ThemeData.light();

  ThemeData get _dark => ThemeData.dark();

  ThemeData get light => _light.copyWith(
        extensions: <ThemeExtension<dynamic>>{
          AppColors.light(),
          AppTextStyle.internal(),
        },
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: _light.appBarTheme.copyWith(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        textTheme: _light.textTheme.apply(
          bodyColor: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white.withOpacity(0.9),
        ),
      );

  ThemeData get dark => _dark.copyWith(
        extensions: <ThemeExtension<dynamic>>{
          AppColors.dark(),
          AppTextStyle.internal(),
        },
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: _dark.appBarTheme.copyWith(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        textTheme: _dark.textTheme.apply(
          bodyColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
      );
}
