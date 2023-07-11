import 'package:flutter_application/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/services/auth_service.dart';
import 'application/services/local_service.dart';
import 'data/data_sources/local/auth_local_data_source.dart';
import 'data/data_sources/mock/auth_mock_data_source.dart';
import 'data/data_sources/remote/auth_api_data_source.dart';
import 'env.dart';
import 'dart:developer' as developer;

Future initializeDependencies() async {
  developer.log('baseUrl: ${Env.instance.baseURL}');
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  GetIt.instance.registerSingleton(AuthNavigationBloc());
  GetIt.instance.registerSingleton(LocalService());
  GetIt.instance.registerSingleton(AuthService(
      AuthMockDataSource(), AuthLocalDataSource(), AuthApiDataSource()));
  GetIt.instance.registerSingleton(AuthBloc());
}
