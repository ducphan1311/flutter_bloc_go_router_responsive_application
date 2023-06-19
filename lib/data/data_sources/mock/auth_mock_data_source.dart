import 'package:tips_and_tricks_flutter/data/dtos/authentication_dto.dart';
import 'package:tips_and_tricks_flutter/data/dtos/profile_dto.dart';
import 'package:tips_and_tricks_flutter/data/repositories/auth/auth_mock_repository.dart';
import 'package:tips_and_tricks_flutter/domain/models/authentication_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/profile_model.dart';


class AuthMockDataSource extends AuthMockRepository{
  @override
  Future<AuthenticationModel> login(String userName, String passWord) async {
    return AuthenticationDto('accessToken', 'refreshToken');
  }

  @override
  Future logout() async {
  }

  @override
  Future<ProfileModel> profile() async {
    return ProfileDto('duc');
  }

  @override
  Future<String> defaultData() async {
    return 'Data Auth';
  }
}