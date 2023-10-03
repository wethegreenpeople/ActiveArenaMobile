import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.more_horiz,
      activeIcon: Icons.close,
      mini: false,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.exit_to_app),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'Leave Arena',
          onTap: () => GoRouter.of(context).go('/play'),
        ),
        SpeedDialChild(
            child: const Icon(Icons.chat_bubble),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Messages'),
      ],
    );
  }
}
