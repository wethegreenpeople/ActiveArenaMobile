import '../models/Arena.dart';

abstract class ArenaSelectionUtils {
  Future<List<Arena>> getOpenArenas();
}
