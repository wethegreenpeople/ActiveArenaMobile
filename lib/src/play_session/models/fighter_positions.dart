class FighterPosition {
  final String fighterId;
  final double x;
  final double y;

  FighterPosition({
    required this.fighterId,
    required this.x,
    required this.y,
  });

  factory FighterPosition.fromJson(Map<String, dynamic> json) {
    return FighterPosition(
      fighterId: json['fighterId'],
      x: json['xLoc'],
      y: json['yLoc'],
    );
  }
}
