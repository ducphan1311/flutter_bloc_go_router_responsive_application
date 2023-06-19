import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(String defaultData) = HomeStateData;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error(dynamic error) = HomeStateError;
}