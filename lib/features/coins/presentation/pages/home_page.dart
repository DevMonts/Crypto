import 'package:crypto/features/coins/presentation/lists/favs_coins_list_view.dart';
import 'package:crypto/features/coins/presentation/lists/other_coins_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  @override
  Widget build(BuildContext context) {
    //final coinsList = CoinRepository.coinsArray;
    // final otherCoinsList = Provider.of<FavsCoinProvider>(
    //   context,
    // ).otherCoinsList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(alignment: Alignment.topCenter, child: FavsCoinsListView()),
          // Divider(),
          // SizedBox(height: 25),
          Container(
            alignment: Alignment.topCenter,
            child: OtherCoinsListView(),
          ),
        ],
      ),
    );
  }
}
