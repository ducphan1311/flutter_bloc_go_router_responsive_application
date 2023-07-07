import 'package:tips_and_tricks_flutter/domain/models/authentication_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/profile_model.dart';

abstract class AuthApiRepository {
  Future<AuthenticationModel> login(String userName, String passWord);

  Future logout();

  Future<ProfileModel> profile();
}
