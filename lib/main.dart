import 'package:flutter/material.dart';
import 'package:flutter_application/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:flutter_application/utils/responsive/breakpoint.dart';
import 'package:flutter_application/utils/responsive/device_type.dart';
import 'package:flutter_application/utils/responsive/responsive_guide_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'application/application.dart';
import 'application/services/local_service.dart';
import 'initialize_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  if (GetIt.instance.get<LocalService>().isAuthorized()) {
    await GetIt.instance.get<AuthBloc>().initializeApp();
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(
        value: GetIt.instance.get<AuthBloc>(),
      ),
      BlocProvider.value(
        value: GetIt.instance.get<AuthNavigationBloc>(),
      ),
    ],
    child: ResponsiveGuideWrapper(child: Application(), breakpoints: [
      const Breakpoint(
          minWidth: 0, maxWidth: 600, deviceType: DeviceType.mobile),
      const Breakpoint(
          minWidth: 601, maxWidth: 900, deviceType: DeviceType.tablet),
      const Breakpoint(
          minWidth: 901,
          maxWidth: double.maxFinite,
          deviceType: DeviceType.desktop),
    ]),
  ));
}
