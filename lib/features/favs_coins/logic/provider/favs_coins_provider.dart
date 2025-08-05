import 'package:crypto/features/home/data/models/coin_model.dart';
import 'package:flutter/material.dart';

class FavsCoinProvider extends ChangeNotifier {
  final List<Coin> favsCoinsList = [];

  void addCoinsToFav(List<Coin> coins) {
    for (var coin in coins) {
      if (!favsCoinsList.contains(coin)) {
        favsCoinsList.add(coin);
      }
    }
    notifyListeners();
  }

  void removeCoinsFromFav(List<Coin> coins) {
    for (var coin in coins) {
      if (favsCoinsList.contains(coin)) {
        favsCoinsList.remove(coin);
      }
    }
    notifyListeners();
  }


  bool isFav(Coin coin) {
    return favsCoinsList.contains(coin);
  }
}
