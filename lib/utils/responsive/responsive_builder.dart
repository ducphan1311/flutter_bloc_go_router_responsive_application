import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/design_config.dart';

import 'inherited_responsive.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    DesignConfig designConfig,
  ) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return builder(context, InheritedResponsive.of(context).designConfig);
    });
  }
}
