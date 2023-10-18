import 'dart:html';

import 'package:flutter/material.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../../constants.dart';
import '../../api_utils/fighter/fighter_model.dart';
import '../models/arena.dart';
import '../players_card/players_card.dart';

class PlayersCardRow extends StatefulWidget {
  final Fighter usersFighter;
  final String arenaId;
  const PlayersCardRow(this.usersFighter, this.arenaId, {Key? key})
      : super(key: key);

  @override
  State<PlayersCardRow> createState() => _PlayersCardRowState();
}

class _PlayersCardRowState extends State<PlayersCardRow> {
  List<Fighter> allFighters = List.empty();
  late final HubConnection hubConnection;

  _PlayersCardRowState() {
    hubConnection =
        HubConnectionBuilder().withUrl("${Constants.apiUrl}/arenaHub").build();
    hubConnection.on('UpdateArena', _handleArenaUpdate);
  }

  @override
  Widget build(BuildContext context) {
    _startConnection(widget.arenaId);
    return Row(
      children: _buildPlayersCards(allFighters, widget.usersFighter),
    );
  }

  List<Widget> _buildPlayersCards(
      List<Fighter> fighters, Fighter usersFighter) {
    final List<Widget> playersCards = [];
    playersCards.add(PlayersCard(
      fighter: usersFighter,
    ));

    for (var fighter in fighters) {
      if (fighter.id == usersFighter.id) continue;
      playersCards.add(PlayersCard(
        fighter: fighter,
      ));
    }

    for (var i = fighters.length; i < 3; i++) {
      playersCards.add(PlayersCard());
    }
    return playersCards;
  }

  void _startConnection(String arenaId) async {
    await hubConnection.start();
    await hubConnection.invoke("JoinArena", args: [arenaId]);
  }

  void _handleArenaUpdate(List<dynamic>? arenaJson) {
    print("UPDATE");
    var arena = Arena.fromJson(arenaJson!.first!);

    setState(() {
      allFighters = arena.fighters
          .map((e) => Fighter(id: e.fighterId, name: e.name, health: 0))
          .toList();
    });
  }
}
