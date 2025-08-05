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
}
