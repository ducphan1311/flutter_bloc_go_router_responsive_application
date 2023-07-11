import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../application/services/auth_service.dart';
import '../../../application/services/local_service.dart';
import '../../../utils/cache.dart';
import '../auth_navigation/auth_navigation_bloc.dart';
import '../auth_navigation/auth_navigation_state.dart';
import 'auth_state.dart';

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
