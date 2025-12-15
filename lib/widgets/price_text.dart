import 'package:flutter/material.dart';
import '../utils/currency_formatter.dart';

class PriceText extends StatelessWidget {
  final int value;
  final TextStyle? style;

  const PriceText(this.value, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text('Rp ${CurrencyFormatter.format(value)}', style: style);
  }
}
