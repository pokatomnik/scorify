import 'package:shared_preferences/shared_preferences.dart';
import 'package:scorify_app/Storage/ScopedAsyncPreferences.dart';

class IntStorage extends ScopedAsyncPreferences<int> {
  IntStorage(String scope, String sep) : super(scope, sep);

  @override
  int? getFromPrefs(SharedPreferences prefs, String key) {
    return prefs.getInt(key);
  }

  @override
  void saveToPrefs(SharedPreferences prefs, String key, int value) {
    prefs.setInt(key, value);
  }
}
