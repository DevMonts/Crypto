import 'package:crypto/app.dart';
import 'package:crypto/features/coins/logic/provider/favs_coins_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavsCoinProvider(),
      child: App(),
    ),
  );
}
