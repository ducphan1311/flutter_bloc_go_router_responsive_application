import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tips_and_tricks_flutter/application/services/auth_service.dart';
import 'package:tips_and_tricks_flutter/application/services/local_service.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/local/auth_local_data_source.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/auth_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/remote/auth_api_data_source.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth/auth_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';

Future initializeDependencies() async {
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  GetIt.instance.registerSingleton(AuthNavigationBloc());
  GetIt.instance.registerSingleton(LocalService());
  GetIt.instance.registerSingleton(AuthService(AuthMockDataSource(), AuthLocalDataSource(), AuthApiDataSource()));
  GetIt.instance.registerSingleton(AuthBloc());




}