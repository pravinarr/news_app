import 'package:flutter/material.dart';

/// A widget that changes its child based on the available width.
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    /// If the width is less than 600, return the mobile widget.
    if (width < 600) {
      return mobile;
    }

    /// If the width is less than 1200, return the tablet widget.
    else if (width < 1200) {
      return tablet;
    }

    /// If the width is greater than 1200, return the desktop widget.
    else {
      return desktop;
    }
  }
}
