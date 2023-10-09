import 'package:flutter/material.dart';

import '../../api_utils/fighter/fighter_model.dart';

class PlayersCard extends StatelessWidget {
  final Fighter? fighter;
  const PlayersCard({this.fighter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Center(
            child: SizedBox(
          height: 50,
          child: Image.asset('assets/images/sprites/player.png'),
        )),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(fighter?.name ?? '???'),
        )
      ]),
    ));
  }
}
