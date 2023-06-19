import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tips_and_tricks_flutter/presentation/blocs/auth_navigation/auth_navigation_state.dart';

class AuthNavigationBloc extends Cubit<AuthNavigationState> {
  AuthNavigationBloc() : super(AuthNavigationState.loadConfig());

  void setState(AuthNavigationState authNavigationState) {
    emit(authNavigationState);
  }
}