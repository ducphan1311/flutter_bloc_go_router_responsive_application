import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/device_type.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/responsive_builder.dart';

typedef WidgetBuilder = Widget Function(BuildContext);

class ScreenTypeLayout extends StatelessWidget {
  final WidgetBuilder? mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  ScreenTypeLayout({
    Key? key,
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
  })  : this.mobile = _builderOrNull(mobile),
        this.tablet = _builderOrNull(tablet),
        this.desktop = _builderOrNull(desktop),
        super(key: key);

  ScreenTypeLayout.builder({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, designInfo) {
      print('designInfo: ${designInfo.toString()}');
      switch (designInfo.deviceType) {
        case DeviceType.mobile:
          return mobile!(context);
        case DeviceType.tablet:
          return (tablet != null) ? tablet!(context) : mobile!(context);
        case DeviceType.desktop:
          return (desktop != null) ? desktop!(context) : mobile!(context);
      }
    });
  }
}
