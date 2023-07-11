import 'package:flutter/material.dart';

import 'design_config.dart';

class InheritedResponsive extends InheritedWidget {
  final DesignConfig designConfig;
  const InheritedResponsive({
    Key? key,
    required Widget child,
    required this.designConfig,
  }) : super(key: key, child: child);

  static InheritedResponsive of(BuildContext context) {
    final InheritedResponsive? result =
        context.dependOnInheritedWidgetOfExactType<InheritedResponsive>();
    assert(result != null, 'No InheritedResponsive found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedResponsive old) {
    return designConfig.deviceType != old.designConfig.deviceType;
  }
}
