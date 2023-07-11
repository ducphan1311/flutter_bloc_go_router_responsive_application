import 'device_type.dart';

class Breakpoint {
  final double minWidth;
  final double maxWidth;
  final DeviceType deviceType;
  final dynamic data;

  const Breakpoint(
      {required this.minWidth,
      required this.maxWidth,
      required this.deviceType,
      this.data});

  Breakpoint copyWith({
    double? minWidth,
    double? maxWidth,
    DeviceType? deviceType,
    dynamic data,
  }) =>
      Breakpoint(
          minWidth: minWidth ?? this.minWidth,
          maxWidth: maxWidth ?? this.maxWidth,
          deviceType: deviceType ?? this.deviceType,
          data: data ?? this.data);
  @override
  int get hashCode =>
      minWidth.hashCode * maxWidth.hashCode * deviceType.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Breakpoint &&
            runtimeType == other.runtimeType &&
            minWidth == other.minWidth &&
            maxWidth == other.maxWidth &&
            deviceType == other.deviceType;
  }

  @override
  String toString() {
    return '{minWidth: $minWidth, maxWidth: $maxWidth, deviceType: $deviceType, data: $data}';
  }
}
