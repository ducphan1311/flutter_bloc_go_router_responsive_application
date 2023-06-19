import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tips_and_tricks_flutter/application/application.dart';
import 'package:tips_and_tricks_flutter/application/services/local_service.dart';
import 'package:tips_and_tricks_flutter/initialize_dependencies.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth/auth_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';

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
    child: Application(),
  ));
}
