import 'package:game_template/src/play_session/models/arena.dart';

import 'arena_selection_utils.dart';

class InMemoryArenaSelection implements ArenaSelectionUtils {
  @override
  Future<Arena> joinOpenArena(String fighterId) async {
    return Arena(fighters: []);
  }
}
