import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/device_type.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/inherited_responsive.dart';

import 'breakpoint.dart';
import 'design_config.dart';

class ResponsiveGuideWrapper extends StatefulWidget {
  static const path = '/responsive_guide_wrapper';
  final Widget child;
  final List<Breakpoint> breakpoints;
  final bool useShortestSide;
  const ResponsiveGuideWrapper(
      {Key? key,
      required this.child,
      required this.breakpoints,
      this.useShortestSide = false})
      : super(key: key);

  @override
  State<ResponsiveGuideWrapper> createState() => _ResponsiveGuideWrapperState();
}

class _ResponsiveGuideWrapperState extends State<ResponsiveGuideWrapper>
    with WidgetsBindingObserver {
  UniqueKey key = UniqueKey();

  Breakpoint breakpoint =
      const Breakpoint(minWidth: 0, maxWidth: 0, deviceType: DeviceType.mobile);

  double windowWidth = 0;
  double getWindowWidth() {
    return MediaQuery.of(context).size.width;
  }

  double windowHeight = 0;
  double getWindowHeight() {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth = 0;
  double getScreenWidth() {
    double widthCalc = widget.useShortestSide
        ? (windowWidth < windowHeight ? windowWidth : windowHeight)
        : windowWidth;

    return widthCalc;
  }

  double screenHeight = 0;
  double getScreenHeight() {
    double heightCalc = widget.useShortestSide
        ? (windowWidth < windowHeight ? windowHeight : windowWidth)
        : windowHeight;

    return heightCalc;
  }

  void setDimensions() {
    windowWidth = getWindowWidth();
    windowHeight = getWindowHeight();
    screenWidth = getScreenWidth();
    screenHeight = getScreenHeight();
    breakpoint = widget.breakpoints.firstWhereOrNull((element) =>
            screenWidth >= element.minWidth &&
            screenWidth <= element.maxWidth) ??
        const Breakpoint(
            minWidth: 0, maxWidth: 0, deviceType: DeviceType.mobile);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setDimensions();
      setState(() {});
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // When physical dimensions change, update state.
    // The required MediaQueryData is only available
    // on the next frame for physical dimension changes.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Widget could be destroyed by resize. Verify widget
      // exists before updating dimensions.
      if (mounted) {
        setDimensions();
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant ResponsiveGuideWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    setDimensions();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InheritedResponsive(
        key: key,
        child: widget.child,
        designConfig: DesignConfig(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            breakpoint: breakpoint,
            breakpoints: widget.breakpoints,
            deviceType: breakpoint.deviceType));
  }
}
