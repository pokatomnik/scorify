import 'IntStorage.dart';


class ScoreTable {
  final IntStorage intStorage = IntStorage('SCORE_TABLE', '|');

  Future<Map<String, int>>? _results;

  Future<void> saveResult(int result) async {
    final currentTimestamp = DateTime.now().toIso8601String();
    await intStorage.setValue(currentTimestamp, result);
    _results = null;
  }

  Future<Map<String, int>> _getAllResults() async {
    final keys = List.from(await intStorage.getAllKeys());
    final List<MapEntry<String, int>> entries = (await Future.wait(
      keys.map((key) {
        return intStorage.getValue(key).then((value) {
          final valueExpected = value == null ? 0 : value;
          return MapEntry(key, valueExpected);
        });
      })
    ));

    final map = Map<String, int>();
    map.addEntries(entries);
    return map;
  }

  Future<Map<String, int>> getAllResults() {
    final currentResults = _results;
    if (currentResults == null) {
      final results = _getAllResults();
      _results = results;
      return results;
    }
    return currentResults;
  }
}