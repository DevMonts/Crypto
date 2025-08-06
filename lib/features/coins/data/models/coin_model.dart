class Coin {
  String icon;
  String name;
  String id;
  double price;
  Coin({
    required this.icon,
    required this.name,
    required this.id,
    required this.price,
  });
  @override
  String toString() {
    return name;
  }

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      icon: json['icon'],
      name: json['name'],
      id: json['id'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'icon': icon, 'name': name, 'id': id, 'price': price};
  }
}
