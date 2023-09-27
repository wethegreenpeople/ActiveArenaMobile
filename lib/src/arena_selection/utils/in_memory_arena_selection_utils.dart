import 'package:game_template/src/arena_selection/models/Arena.dart';

import 'arena_selection_utils.dart';

class InMemoryArenaSelection implements ArenaSelectionUtils {
  @override
  Future<List<Arena>> getOpenArenas() {
    const arenas = [
      Arena(id: "123", name: "Test", fighters: 1),
      Arena(id: "123", name: "Doot", fighters: 3),
      Arena(id: "123", name: "Daat", fighters: 0)
    ];
    return Future.value(List.of(arenas));
  }
}
