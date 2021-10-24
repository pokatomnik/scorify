import 'package:shared_preferences/shared_preferences.dart';

abstract class AsyncPreferences<T> {
  Future<SharedPreferences>? _preferences;

  Future<SharedPreferences> get _sharedPreferences {
    final prefs = _preferences;

    if (prefs == null) {
      return _preferences = SharedPreferences.getInstance().then((prefs) {
        _preferences = Future.value(prefs);
        return prefs;
      });
    }

    return prefs;
  }

  T? getFromPrefs(SharedPreferences prefs, String key);

  void saveToPrefs(SharedPreferences prefs, String key, T value);

  Future<T?> getValue(String key) async {
    return getFromPrefs(await _sharedPreferences, key);
  }

  Future<void> setValue(String key, T value) async {
    saveToPrefs(await _sharedPreferences, key, value);
  }

  Future<void> removeValue(String key) async {
    (await _sharedPreferences).remove(key);
  }

  Future<Set<String>> getAllKeys() async {
    return (await _sharedPreferences).getKeys();
  }
}