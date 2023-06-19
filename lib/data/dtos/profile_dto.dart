import 'package:json_annotation/json_annotation.dart';
import 'package:tips_and_tricks_flutter/domain/models/profile_model.dart';
part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDto extends ProfileModel{

  factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);

  @override
  String userName;

  ProfileDto(this.userName);
}