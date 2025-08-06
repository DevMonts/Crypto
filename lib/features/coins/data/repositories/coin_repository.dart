import 'package:crypto/features/coins/data/models/coin_model.dart';

class CoinRepository {
  static List<Coin> coinsArray = [
    Coin(
      icon: 'assets/icons/bitcoin.png',
      name: 'Bitcoin',
      id: 'BTC',
      price: 600000.0,
    ),
    Coin(
      icon: 'assets/icons/cardano.png',
      name: 'Cardano',
      id: 'ADA',
      price: 3.0,
    ),
    Coin(
      icon: 'assets/icons/ethereum.png',
      name: 'Ethereum',
      id: 'ETH',
      price: 14000.0,
    ),
    Coin(
      icon: 'assets/icons/litecoin.png',
      name: 'Litecoin',
      id: 'LTC',
      price: 500.0,
    ),
    Coin(
      icon: 'assets/icons/usdcoin.png',
      name: 'USD Coin',
      id: 'USDC',
      price: 6.0,
    ),
    Coin(icon: 'assets/icons/xrp.png', name: 'XRP', id: 'XRP', price: 12.0),
  ];
}
