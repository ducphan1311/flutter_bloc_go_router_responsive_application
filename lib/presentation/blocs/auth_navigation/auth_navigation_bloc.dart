import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_navigation_state.dart';

class AuthNavigationBloc extends Cubit<AuthNavigationState> {
  AuthNavigationBloc() : super(AuthNavigationState.loadConfig());

  void setState(AuthNavigationState authNavigationState) {
    emit(authNavigationState);
  }
}
