import 'dart:convert';

class Game {
  final int id;

  final String name;

  final String price;

  const Game({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'id': id,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source));
}
