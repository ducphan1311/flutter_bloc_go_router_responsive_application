import '../../../domain/models/authentication_model.dart';
import '../../../domain/models/profile_model.dart';
import '../../repositories/auth/auth_api_repository.dart';

class AuthApiDataSource extends AuthApiRepository {
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
}
