import 'package:my_practice_bloc/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _prefs;

  SharedPreferencesHelper() : _prefs = myInjection<SharedPreferences>();

  Future<void> setUrl(String url) async {
    await _prefs.setString('url', url);
  }

  Future<String?> getUrl() async {
    return _prefs.getString('url');
  }

  Future<void> removeUrl() async {
    await _prefs.remove('url');
  }
}