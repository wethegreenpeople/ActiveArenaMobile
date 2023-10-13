import '../../play_session/models/arena.dart';

abstract class ArenaSelectionUtils {
  Future<Arena> joinOpenArena(String fighterId);
}
