import 'package:flutter/material.dart';

class PlayersCard extends StatefulWidget {
  const PlayersCard({Key? key}) : super(key: key);

  @override
  State<PlayersCard> createState() => _PlayersCardState();
}

class _PlayersCardState extends State<PlayersCard> {
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
          child: Text("Robert(o)"),
        )
      ]),
    ));
  }
}
