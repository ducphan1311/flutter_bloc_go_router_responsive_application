import 'package:get_it/get_it.dart';

import '../../data/repositories/auth/auth_api_repository.dart';
import '../../data/repositories/auth/auth_local_reposirory.dart';
import '../../data/repositories/auth/auth_mock_repository.dart';
import '../../domain/models/authentication_model.dart';
import '../../domain/models/profile_model.dart';
import 'local_service.dart';

class AuthService {
  AuthService(
    this.authMockRepository,
    this.authLocalRepository,
    this.authApiRepository,
  );

  final AuthMockRepository authMockRepository;
  final AuthLocalRepository authLocalRepository;
  final AuthApiRepository authApiRepository;

  final _localService = GetIt.instance.get<LocalService>();

  Future<AuthenticationModel> login(String userName, String passWord) {
    return authMockRepository.login(userName, passWord);
  }

  Future logout() {
    return authMockRepository.logout();
  }

  Future<ProfileModel> profile() {
    return authMockRepository.profile();
  }

  Future<String> defaultData() {
    if (_localService.isAuthorized()) {
      return authMockRepository.defaultData();
    } else {
      return authLocalRepository.defaultData();
    }
  }
}
