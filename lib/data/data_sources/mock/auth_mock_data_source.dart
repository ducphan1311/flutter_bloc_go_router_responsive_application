
import '../../../domain/models/authentication_model.dart';
import '../../../domain/models/profile_model.dart';
import '../../dtos/authentication_dto.dart';
import '../../dtos/profile_dto.dart';
import '../../repositories/auth/auth_mock_repository.dart';

class AuthMockDataSource extends AuthMockRepository {
  @override
  Future<AuthenticationModel> login(String userName, String passWord) async {
    return AuthenticationDto('accessToken', 'refreshToken');
  }

  @override
  Future logout() async {}

  @override
  Future<ProfileModel> profile() async {
    return ProfileDto('duc');
  }

  @override
  Future<String> defaultData() async {
    return 'Data Auth';
  }
}
