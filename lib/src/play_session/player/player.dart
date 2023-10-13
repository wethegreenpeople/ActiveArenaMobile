import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_template/src/play_session/arena/game_arena.dart';

class Player extends SpriteComponent with HasGameRef<GameArena> {
  final double startingX;
  final double staringY;

  Player(this.startingX, this.staringY);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('sprites/player.png');

    var startingPosition = gameRef.size;
    startingPosition.multiply(Vector2(startingX / 100, staringY / 100));
    position = startingPosition;
    width = 40;
    height = 50;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
