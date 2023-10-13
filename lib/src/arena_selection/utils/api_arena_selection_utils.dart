import '../../api_utils/fighter/arena_api.dart';
import '../../api_utils/fighter/fighter_model.dart';
import '../../play_session/models/arena.dart';
import '../../play_session/models/fighter_positions.dart';
import 'arena_selection_utils.dart';

class ApiArenaSelection implements ArenaSelectionUtils {
  @override
  Future<Arena> joinOpenArena(String fighterId) async {
    var arenaApi = ArenaApi();
    var arena = await arenaApi.joinArena(fighterId);

    return arena!;
  }
}
