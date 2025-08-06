import 'dart:convert';

import 'package:crypto/features/coins/data/models/coin_model.dart';
import 'package:crypto/features/coins/data/repositories/coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavsCoinProvider extends ChangeNotifier {
  final List<Coin> favsCoinsList = [];
  final List<Coin> otherCoinsList = List.from(CoinRepository.coinsArray);

  FavsCoinProvider() {
    loadFavCoinsSharedPreferences();
  }
  Future<void> loadFavCoinsSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? favCoinsJson = sharedPreferences.getString('favCoinsList');
    if (favCoinsJson != null) {
      final List<dynamic> favCoinsJsonList = jsonDecode(favCoinsJson);
      favCoinsJsonList.forEach((coinJson) {
        favsCoinsList.add(Coin.fromJson(coinJson));
      });
    }
    otherCoinsList.removeWhere((coin) => favsCoinsList.contains(coin));
    saveFavCoinsSharedPreferences();
    notifyListeners();
  }

  Future<void> saveFavCoinsSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final favCoinsJson = jsonEncode(
      favsCoinsList.map((coin) => coin.toJson()).toList(),
    );
    await sharedPreferences.setString('favCoinsList', favCoinsJson);
  }

  void addCoinsToFav(List<Coin> coins) {
    for (var coin in coins) {
      if (!favsCoinsList.contains(coin)) {
        favsCoinsList.add(coin);
        otherCoinsList.remove(coin);
      }
    }
    saveFavCoinsSharedPreferences();
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
