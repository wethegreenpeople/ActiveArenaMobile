// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:game_template/src/arena_selection/models/Arena.dart';
import 'package:game_template/src/arena_selection/utils/in_memory_arena_selection_utils.dart';
import 'package:game_template/src/style/nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class ArenaSelectionScreen extends StatelessWidget {
  const ArenaSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    var arenaUtils = InMemoryArenaSelection();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      bottomNavigationBar: NavBar(),
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Robert(o)',
                  style:
                      TextStyle(fontFamily: 'Permanent Marker', fontSize: 30),
                ),
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Image(
                      image: AssetImage('assets/images/sprites/player.png')),
                )
              ],
            ),
          ],
        ),
        rectangularMenuArea: FilledButton(
          onPressed: () {
            GoRouter.of(context).go('/play/session/1');
          },
          child: const Text('Join Arena'),
        ),
      ),
    );
  }
}
