class FighterPosition {
  final String fighterId;
  final String name;
  final double x;
  final double y;
  final int xDirection;
  final int yDirection;

  FighterPosition({
    required this.fighterId,
    required this.name,
    required this.x,
    required this.y,
    required this.xDirection,
    required this.yDirection,
  });

  factory FighterPosition.fromJson(Map<String, dynamic> json) {
    return FighterPosition(
      fighterId: json['fighterId'],
      x: (json['xLoc'] as int).toDouble(),
      y: (json['yLoc'] as int).toDouble(),
      name: json['fighterName'],
      xDirection: json['xDirection'],
      yDirection: json['yDirection'],
    );
  }
}
