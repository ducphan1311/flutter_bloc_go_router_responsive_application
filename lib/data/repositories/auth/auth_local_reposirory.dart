import '../../../domain/models/authentication_model.dart';
import '../../../domain/models/profile_model.dart';

abstract class AuthLocalRepository {
  Future<AuthenticationModel> login(String userName, String passWord);

  Future logout();

  Future<ProfileModel> profile();

  Future<String> defaultData();
}
