import 'package:my_practice_bloc/core/services/shared_preferences.dart';


abstract class AuthLocalDatasource {
  Future<void> authSetUrl(String url);
  Future<void> authRemoveUrl();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  AuthLocalDatasourceImpl(this._sharedPreferencesHelper);

  @override
  Future<void> authSetUrl(String url) async {
    await _sharedPreferencesHelper.setUrl(url);
  }
  
  @override
  Future<void> authRemoveUrl() {
    return _sharedPreferencesHelper.removeUrl();
  }
}