import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tips_and_tricks_flutter/application/services/auth_service.dart';
import 'package:tips_and_tricks_flutter/application/services/local_service.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/local/auth_local_data_source.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/mock/auth_mock_data_source.dart';
import 'package:tips_and_tricks_flutter/data/data_sources/remote/auth_api_data_source.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth/auth_state.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_state.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/home/home_bloc.dart';
import 'package:tips_and_tricks_flutter/utils/cache.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.unAuthorized());

  final authNavigationBloc = GetIt.instance.get<AuthNavigationBloc>();

  final authService = GetIt.instance.get<AuthService>();

  final localService = GetIt.instance.get<LocalService>();

  Future login(String userName, String passWord) async {
    final auth = await authService.login(userName, passWord);
    final profile = await authService.profile();
    Cache.profile = profile;
    localService.saveAuth(isAuth: true);
    emit(AuthState.authorized(profile));
    authNavigationBloc.setState(AuthNavigationState.authorized());
  }

  void logout() {
    Cache.profile = null;
    localService.saveAuth();
    emit(AuthState.unAuthorized());
    authNavigationBloc.setState(AuthNavigationState.guestMode());
  }

  Future initializeApp() async {
    final profile = await authService.profile();
    Cache.profile = profile;
    emit(AuthState.authorized(profile));
  }
}
