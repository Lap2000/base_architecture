part of 'extensions.dart';

extension SizeBoxExt on int {
  Widget get w => SizedBox(width: toDouble());

  Widget get h => SizedBox(height: toDouble());

  TextStyle normal(BuildContext ctx, Color? color) =>
      ctx.styles.normal.size(toDouble()).c(color);

  TextStyle bold(BuildContext ctx, Color? color) =>
      ctx.styles.bold.size(toDouble()).c(color);
}

extension FontSizeExt on TextStyle {
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle c(Color? color) => copyWith(color: color);
}
