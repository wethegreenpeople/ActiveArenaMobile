import 'package:game_template/src/play_session/models/fighter_positions.dart';

class Arena {
  final List<FighterPosition> fighters;

  Arena({required this.fighters});

  factory Arena.fromJson(Map<String, dynamic> json) {
    return Arena(
        fighters: (json['fighters'] as List<dynamic>)
            .map((fighter) => FighterPosition.fromJson(fighter))
            .toList());
  }
}
