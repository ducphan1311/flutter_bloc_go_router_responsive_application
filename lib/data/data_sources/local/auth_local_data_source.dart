import 'package:tips_and_tricks_flutter/data/repositories/auth/auth_local_reposirory.dart';
import 'package:tips_and_tricks_flutter/domain/models/authentication_model.dart';
import 'package:tips_and_tricks_flutter/domain/models/profile_model.dart';


class AuthLocalDataSource extends AuthLocalRepository{
  @override
  Future<AuthenticationModel> login(String userName, String passWord) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> profile() {
    // TODO: implement profile
    throw UnimplementedError();
  }

  @override
  Future<String> defaultData() async {
    return 'Data unAuth';
  }
}