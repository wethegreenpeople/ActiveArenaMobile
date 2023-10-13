import 'package:game_template/src/arena_selection/utils/api_arena_selection_utils.dart';
import 'package:game_template/src/arena_selection/utils/in_memory_arena_selection_utils.dart';
import 'package:game_template/src/play_session/models/arena.dart';
import 'package:test/test.dart';

void main() {
  final arenaUtils = ApiArenaSelection();
  group('getOpenArenas', () {
    test('returns an open arena', () async {
      // Arrange
      const fighterId = "1";

      // Act
      final result = await arenaUtils.joinOpenArena(fighterId);

      // Assert
      expect(result, isA<Arena>());
      expect(result.fighters.length, 1);
    });
  });
}
