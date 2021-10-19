import './IntStorage.dart';

class RecentValue {
  static const _KEY = 'value';

  final IntStorage recentStorage = IntStorage('RECENT_VALUE', '|');

  final int _defaultValue;

  RecentValue(this._defaultValue);

  Future<int> get() async {
    final int? value = await recentStorage.getValue(_KEY);
    return value == null ? _defaultValue : value;
  }

  Future<void> set(int value) {
    return recentStorage.setValue(_KEY, value);
  }
}