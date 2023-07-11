import 'package:collection/collection.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/device_type.dart';

import 'breakpoint.dart';

class DesignConfig {
  final double screenWidth;
  final double screenHeight;
  final Breakpoint breakpoint;
  final List<Breakpoint> breakpoints;
  final DeviceType deviceType;

  const DesignConfig(
      {this.screenWidth = 0,
      this.screenHeight = 0,
      this.breakpoint = const Breakpoint(
          minWidth: 0, maxWidth: 0, deviceType: DeviceType.mobile),
      this.breakpoints = const [],
      this.deviceType = DeviceType.mobile});

  bool equals(DeviceType deviceType) => breakpoint.deviceType == deviceType;

  bool largerThan(String name) =>
      screenWidth >
      (breakpoints
              .firstWhereOrNull((element) => element.deviceType == deviceType)
              ?.maxWidth ??
          double.infinity);

  bool smallerThan(String name) =>
      screenWidth <
      (breakpoints
              .firstWhereOrNull((element) => element.deviceType == deviceType)
              ?.minWidth ??
          0);

  DesignConfig copyWith({double? screenWidth, double? screenHeight}) {
    return DesignConfig(
        screenWidth: screenWidth ?? this.screenWidth,
        screenHeight: screenHeight ?? this.screenHeight,
        breakpoint: this.breakpoint,
        breakpoints: this.breakpoints,
        deviceType: this.deviceType);
  }

  @override
  int get hashCode =>
      screenWidth.hashCode * screenHeight.hashCode * breakpoint.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignConfig &&
          runtimeType == other.runtimeType &&
          screenWidth == other.screenWidth &&
          screenHeight == other.screenHeight &&
          breakpoint == other.breakpoint;

  @override
  String toString() {
    return '{screenWidth: $screenWidth, screenHeight: $screenHeight, breakpoint: ${breakpoint.toString()}, deviceType: $deviceType}' ;
  }
}
