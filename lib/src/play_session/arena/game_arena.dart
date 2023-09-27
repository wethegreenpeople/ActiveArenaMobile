import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../player/player.dart';
import 'game_arena_world.dart';

class GameArena extends FlameGame {
  late final CameraComponent cameraComponent;
  final GameArenaWorld world;

  GameArena() : world = GameArenaWorld() {
    cameraComponent = CameraComponent(world: world);
  }

  @override
  Future<void> onLoad() async {
    addAll([cameraComponent, world]);
    debugMode = true;

    await super.onLoad();
  }
}
