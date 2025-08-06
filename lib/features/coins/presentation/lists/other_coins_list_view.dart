import 'package:crypto/common/constants/app_colors.dart';
import 'package:crypto/features/coins/logic/provider/favs_coins_provider.dart';
import 'package:crypto/features/coins/presentation/widget/coin_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OtherCoinsListView extends StatefulWidget {
  const OtherCoinsListView({super.key});

  @override
  State<OtherCoinsListView> createState() => _OtherCoinsListViewState();
}

class _OtherCoinsListViewState extends State<OtherCoinsListView> {
  @override
  Widget build(BuildContext context) {
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    final otherCoinsList = Provider.of<FavsCoinProvider>(
      context,
    ).otherCoinsList;
    return ListView.builder(
      itemBuilder: (BuildContext context, int coin) {
        return ListTile(
          leading: Image.asset(otherCoinsList[coin].icon),
          title: Text(otherCoinsList[coin].name),
          subtitle: Text(real.format(otherCoinsList[coin].price)),
          trailing: Consumer<FavsCoinProvider>(
            builder: (_, favsCoinProvider, __) {
              final isFav = favsCoinProvider.isFav(otherCoinsList[coin]);
              return IconButton(
                onPressed: () {
                  final favsCoinProvider = Provider.of<FavsCoinProvider>(
                    context,
                    listen: false,
                  );
                  isFav
                      ? favsCoinProvider.removeCoinsFromFav([
                          otherCoinsList[coin],
                        ])
                      : favsCoinProvider.addCoinsToFav([otherCoinsList[coin]]);
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.heart_broken,
                  color: isFav ? AppColors.red : AppColors.redIfOpacity,
                ),
              );
            },
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CoinDetailsDialog(coin: otherCoinsList[coin]);
              },
            );
          },
        );
      },
      itemCount: otherCoinsList.length,
      shrinkWrap: true,
    );
  }
}
