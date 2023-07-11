import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/profile_model.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.authorized(ProfileModel profileModel) =
      AuthStateAuthorized;
  const factory AuthState.unAuthorized() = AuthStateUnAuthorized;
}
