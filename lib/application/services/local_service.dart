import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  final String keyAuth = 'key_auth';

  final _sharedPref = GetIt.instance.get<SharedPreferences>();

  bool isAuthorized() {
    return _sharedPref.containsKey(keyAuth);
  }

  void saveAuth({bool isAuth = false}) {
    if (isAuth) {
      _sharedPref.setBool(keyAuth, isAuth);
    } else {
      _sharedPref.clear();
    }
  }
}