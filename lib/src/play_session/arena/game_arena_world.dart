import 'dart:async';
import 'dart:convert';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game_template/constants.dart';
import 'package:game_template/src/play_session/arena/game_arena.dart';
import 'package:game_template/src/play_session/models/arena.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';
import '../../api_utils/fighter/fighter_model.dart';
import '../player/player.dart';

class GameArenaWorld extends World with HasGameRef<GameArena> {
  Arena arena;
  final String playerFighterId;
  late final HubConnection hubConnection;
  static final _log = Logger('PlaySessionScreen');
  GameArenaWorld(this.arena, this.playerFighterId, {super.children}) {
    hubConnection =
        HubConnectionBuilder().withUrl("${Constants.apiUrl}/arenaHub").build();
    hubConnection.on('UpdateArena', handleArenaUpdate);
  }

  late Player player;
  late List<Player?> players = [];
  late TiledComponent map;
  late Vector2 size = Vector2(
    map.tileMap.map.width * 32,
    map.tileMap.map.height * 32,
  );

  @override
  FutureOr<void> onLoad() async {
    if (hubConnection.state == HubConnectionState.Disconnected) {
      await hubConnection.start();
      await hubConnection.invoke("JoinArena", args: [arena.id]);
    }

    map = await TiledComponent.load('desert_map.tmx', Vector2.all(32));
    add(map);
    for (var fighter in arena.fighters) {
      var player = Player(fighter.x, fighter.y, fighter.fighterId);
      players.add(player);
      add(player);

      if (fighter.fighterId == playerFighterId) {
        this.player = player;
        gameRef.cameraComponent.follow(player);
      }
    }
  }

  @override
  void update(double dt) {
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

  void handleArenaUpdate(List<dynamic>? arenaJson) {
    arena = Arena.fromJson(arenaJson!.first!);

    for (var fighter in arena.fighters) {
      var player = players.firstWhere(
          (element) => element?.fighterId == fighter.fighterId,
          orElse: () => null);
      if (player == null) {
        player = Player(fighter.x, fighter.y, fighter.fighterId);
        players.add(player);
        add(player);
      }
      var currentPos = player.position;
      var newPos =
          Vector2(size.x * ((fighter.x) / 100), size.y * (fighter.y) / 100);

      var delta = Vector2(newPos.x - currentPos.x, newPos.y - currentPos.y);

      player.move(delta);
    }
  }
}
