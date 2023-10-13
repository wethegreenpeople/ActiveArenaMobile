import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game_template/src/play_session/arena/game_arena.dart';
import 'package:game_template/src/play_session/models/arena.dart';

import '../player/player.dart';

class GameArenaWorld extends World with HasGameRef<GameArena> {
  final Arena arena;
  final String playerFighterId;
  GameArenaWorld(this.arena, this.playerFighterId, {super.children});

  late Player player;
  late TiledComponent map;
  late Vector2 size = Vector2(
    map.tileMap.map.width * 32,
    map.tileMap.map.height * 32,
  );

  @override
  FutureOr<void> onLoad() async {
    map = await TiledComponent.load('desert_map.tmx', Vector2.all(32));
    add(map);
    for (var fighter in arena.fighters) {
      var player = Player(fighter.x, fighter.y);
      add(player);

      if (fighter.fighterId == playerFighterId) {
        this.player = player;
        gameRef.cameraComponent.follow(player);
      }
    }
  }

  @override
  void update(double dt) {
    player.move(Vector2(1, 0));
    if (!gameRef.cameraComponent.canSee(player)) {
      player.move(Vector2(-600, 0));
    }

    super.update(dt);
  }

  @override
  void onGameResize(Vector2 size) {
    setCameraBounds(size);
    super.onGameResize(size);
  }

  void setCameraBounds(Vector2 gameSize) {
    gameRef.cameraComponent.setBounds(
      Rectangle.fromLTRB(
        gameSize.x / 2,
        gameSize.y / 2,
        size.x - gameSize.x / 2,
        size.y - gameSize.y / 2,
      ),
    );
  }
}
