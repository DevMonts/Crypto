import 'package:crypto/common/constants/app_colors.dart';
import 'package:crypto/features/favs_coins/logic/provider/favs_coins_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FavsCoinsListView extends StatefulWidget {
  const FavsCoinsListView({super.key});

  @override
  State<FavsCoinsListView> createState() => _FavsCoinsListViewState();
}

class _FavsCoinsListViewState extends State<FavsCoinsListView> {
  @override
  Widget build(BuildContext context) {
    final favsCoinsList = Provider.of<FavsCoinProvider>(context).favsCoinsList;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return ListView.builder(
      itemBuilder: (BuildContext context, int coin) {
        return ListTile(
          leading: Image.asset(favsCoinsList[coin].icon),
          title: Text(favsCoinsList[coin].name),
          subtitle: Text(
            real.format(
              favsCoinsList[coin].price,
            ),
          ),
          trailing: Consumer<FavsCoinProvider>(
            builder: (_, favsCoinProvider, __) {
              final isFav = favsCoinProvider.isFav(favsCoinsList[coin]);
              return IconButton(
                onPressed: () {
                  final favsCoinProvider = Provider.of<FavsCoinProvider>(
                    context,
                    listen: false,
                  );
                  isFav
                      ? favsCoinProvider.removeCoinsFromFav([
                          favsCoinsList[coin],
                        ])
                      : favsCoinProvider.addCoinsToFav([favsCoinsList[coin]]);
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.heart_broken,
                  color: isFav ? AppColors.red : AppColors.redIfOpacity,
                ),
              );
            },
          ),
        );
      },
      itemCount: favsCoinsList.length,
      shrinkWrap: true,
    );
  }
}
