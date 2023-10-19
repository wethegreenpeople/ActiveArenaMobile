import 'dart:convert';

import 'package:game_template/src/api_utils/fighter/fighter_model.dart';

import 'arena.dart';

class JoinArena {
  final Arena arena;
  final Fighter selectedFighter;

  JoinArena({required this.arena, required this.selectedFighter});

  Map<String, dynamic> toJson() {
    return jsonDecode(jsonEncode(this));
  }
}
