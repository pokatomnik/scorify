import 'package:scorify_app/Storage/AsyncPreferences.dart';

abstract class ScopedAsyncPreferences<T> extends AsyncPreferences<T> {
  final String _scope;

  final String _sep;

  ScopedAsyncPreferences(this._scope, this._sep);

  String _toScopeKey(String key) {
    return '$_scope$_sep$key';
  }

  String _fromScopeKey(String key) {
    final parts = key.split(_sep);
    if (parts.length < 2) {
      throw Exception('Invalid key');
    }
    return parts[1];
  }

  bool _isScopeKey(String key) {
    final parts = key.split(_sep);
    if (parts.length < 2) {
      throw Exception('Invalid key');
    }
    final scope = parts[0];
    return scope == _scope;
  }

  @override
  Future<T?> getValue(String key) async {
    return super.getValue(_toScopeKey(key));
  }

  @override
  Future<void> setValue(String key, T value) async {
    return super.setValue(_toScopeKey(key), value);
  }

  @override
  Future<void> removeValue(String key) async {
    return super.removeValue(_toScopeKey(key));
  }

  @override
  Future<Set<String>> getAllKeys() async {
    final allKeys = await super.getAllKeys();
    return allKeys.fold<Set<String>>(Set(), (keys, currentKey) {
      final bool isScoped = _isScopeKey(currentKey);
      if (!isScoped) {
        return keys;
      }
      keys.add(_fromScopeKey(currentKey));
      return keys;
    });
  }
}