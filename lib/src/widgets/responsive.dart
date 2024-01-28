import 'package:flutter/material.dart';

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
    if (width < 600) {
      return mobile;
    } else if (width < 1200) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
