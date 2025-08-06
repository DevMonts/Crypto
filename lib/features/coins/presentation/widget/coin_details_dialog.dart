import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDetailsDialog extends StatefulWidget {
  const CoinDetailsDialog({super.key, required this.coin});
  final dynamic coin;
  @override
  State<CoinDetailsDialog> createState() => _CoinDetailsDialogState();
}

class _CoinDetailsDialogState extends State<CoinDetailsDialog> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image.asset(widget.coin.icon, height: 30, width: 30),
          Text('  ${widget.coin.id} - ${widget.coin.name}'),
        ],
      ),

      content: Text(real.format(widget.coin.price)),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.sensor_door),
        ),
      ],
    );
  }
}
