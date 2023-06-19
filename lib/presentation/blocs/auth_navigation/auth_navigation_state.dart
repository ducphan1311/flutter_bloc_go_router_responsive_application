import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_navigation_state.freezed.dart';

@freezed
abstract class AuthNavigationState with _$AuthNavigationState {
  const factory AuthNavigationState.authorized() =
      AuthNavigationStateAuthorized;
  const factory AuthNavigationState.unAuthorized() =
      AuthNavigationStateUnAuthorized;
  const factory AuthNavigationState.guestMode() = AuthNavigationStateGuestMode;
  const factory AuthNavigationState.loadConfig() =
      AuthNavigationStateLoadConfig;
}
