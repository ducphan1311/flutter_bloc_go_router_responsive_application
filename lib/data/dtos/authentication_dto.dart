import 'package:json_annotation/json_annotation.dart';
import 'package:tips_and_tricks_flutter/domain/models/authentication_model.dart';
part 'authentication_dto.g.dart';

@JsonSerializable()
class AuthenticationDto extends AuthenticationModel{
  AuthenticationDto(this.accessToken, this.refreshToken);

  @override
  String accessToken;

  @override
  String refreshToken;

  factory AuthenticationDto.fromJson(Map<String, dynamic> json) => _$AuthenticationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationDtoToJson(this);


}