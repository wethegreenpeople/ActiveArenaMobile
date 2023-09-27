import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/play_session/arena/game_arena.dart';

class Player extends SpriteComponent with HasGameRef<GameArena> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('sprites/player.png');

    position = gameRef.size / 2;
    width = 40;
    height = 50;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
