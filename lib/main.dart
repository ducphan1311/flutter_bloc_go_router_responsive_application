import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tips_and_tricks_flutter/application/application.dart';
import 'package:tips_and_tricks_flutter/application/services/local_service.dart';
import 'package:tips_and_tricks_flutter/initialize_dependencies.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth/auth_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/breakpoint.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/design_config.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/device_type.dart';
import 'package:tips_and_tricks_flutter/utils/responsive/responsive_guide_wrapper.dart';

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
