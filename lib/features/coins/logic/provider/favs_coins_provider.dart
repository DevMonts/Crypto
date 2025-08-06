import 'package:crypto/features/coins/data/models/coin_model.dart';
import 'package:crypto/features/coins/data/repositories/coin_repository.dart';
import 'package:flutter/material.dart';

class FavsCoinProvider extends ChangeNotifier {
  final List<Coin> favsCoinsList = [];
  final List<Coin> otherCoinsList = List.from(CoinRepository.coinsArray);
  void addCoinsToFav(List<Coin> coins) {
    for (var coin in coins) {
      if (!favsCoinsList.contains(coin)) {
        favsCoinsList.add(coin);
        otherCoinsList.remove(coin);
      }
    }
    notifyListeners();
  }

  void removeCoinsFromFav(List<Coin> coins) {
    for (var coin in coins) {
      if (favsCoinsList.contains(coin)) {
        favsCoinsList.remove(coin);
        otherCoinsList.add(coin);
      }
    }
    notifyListeners();
  }

  bool isFav(Coin coin) {
    return favsCoinsList.contains(coin);
  }
}
