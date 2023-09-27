import 'package:game_template/src/arena_selection/utils/in_memory_arena_selection_utils.dart';
import 'package:test/test.dart';

void main() {
  final arenaUtils = InMemoryArenaSelection();
  group('getOpenArenas', () {
    test('returns a list of arenas', () async {
      // Arrange

      // Act
      final result = await arenaUtils.getOpenArenas();

      // Assert
      expect(result, isA<List>());
      expect(result, isNotEmpty);
    });
  });
}
