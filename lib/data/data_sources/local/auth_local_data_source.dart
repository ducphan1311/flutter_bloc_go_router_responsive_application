import '../../../domain/models/authentication_model.dart';
import '../../../domain/models/profile_model.dart';
import '../../repositories/auth/auth_local_reposirory.dart';

class AuthLocalDataSource extends AuthLocalRepository {
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
