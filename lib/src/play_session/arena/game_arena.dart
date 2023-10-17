import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/api_utils/fighter/fighter_model.dart';
import 'package:game_template/src/play_session/models/join_arena.dart';

import '../models/arena.dart';
import '../player/player.dart';
import 'game_arena_world.dart';

class GameArena extends FlameGame {
  final JoinArena arena;
  late final CameraComponent cameraComponent;
  final List<Fighter> allFighters;
  Function parentSetState;

  @override
  final GameArenaWorld world;

  GameArena(this.arena, this.allFighters, this.parentSetState)
      : world = GameArenaWorld(arena.arena, arena.selectedFighter.id,
            allFighters, parentSetState) {
    cameraComponent = CameraComponent(world: world);
  }

  @override
  Future<void> onLoad() async {
    addAll([cameraComponent, world]);
    debugMode = false;

    await super.onLoad();
  }

  @override
  void onRemove() {
    world.hubConnection.stop();
    super.onRemove();
  }
}
