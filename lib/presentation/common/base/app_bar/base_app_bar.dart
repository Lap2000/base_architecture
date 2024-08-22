import 'package:flutter/material.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.children,
    this.currentLocation,
    this.toolbarHeight = 132,
  });

  final String? title;
  final List<Widget>? children;
  final String? currentLocation;
  final double toolbarHeight;

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return const Row(
          children: [],
        );
      },
    );
  }
}
