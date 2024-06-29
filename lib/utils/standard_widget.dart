import 'package:flutter/material.dart';


class StandardWidget {
  static final Color bgShade50 = Colors.blue.shade50;
  static final Color bgShade100 = Colors.blue.shade100;
  static final Color bgShade200 = Colors.blue.shade200;

  static Widget selectListItem({
    VoidCallback? onTap,
    required Widget child,
  }) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        splashColor: bgShade200,
        hoverColor: bgShade50,
        child: child,
      ),
    );
  }

  static Widget bg({
    required double width,
    required Widget child,
    required ScrollController scrollController,
  }) {
    return Scrollbar(
      thumbVisibility: true,
      controller: scrollController,
      interactive: true,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
