import '../../../domain/models/authentication_model.dart';
import '../../../domain/models/profile_model.dart';

abstract class AuthApiRepository {
  Future<AuthenticationModel> login(String userName, String passWord);

  Future logout();

  Future<ProfileModel> profile();
}
