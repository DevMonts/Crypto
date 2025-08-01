import 'package:crypto/features/home/data/repositories/coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  @override
  Widget build(BuildContext context) {
    final coinsList = CoinRepository.coinsArray;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int coin) {
          return ListTile(
            leading: Image.asset(coinsList[coin].icon),
            title: Text(coinsList[coin].name),
            subtitle: Text(
              real.format(
                coinsList[coin].price, //.toString()
              ),
            ),
            //trailing: Icon(Icons.arrow_right),
            //onTap: () {},
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: coinsList.length,
        padding: EdgeInsets.only(top: 10, bottom: 10),
      ),
    );
  }
}
