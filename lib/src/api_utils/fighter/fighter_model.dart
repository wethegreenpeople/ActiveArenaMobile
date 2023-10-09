class Fighter {
  final String? name;
  final int health;
  final String id;

  Fighter({
    required this.name,
    required this.health,
    required this.id,
  });

  factory Fighter.fromJson(Map<String, dynamic> json) {
    return Fighter(
      name: json['name'],
      health: json['health'],
      id: json['id'],
    );
  }
}
