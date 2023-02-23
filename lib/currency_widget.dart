import 'package:flutter/material.dart';


//defines Icon and size in the currency box
class CurrencyWidget extends StatelessWidget {

  CurrencyWidget(
      {required this.currency,
        required this.iconSize,

        });

  final IconData currency;
  final double iconSize;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(currency, size: iconSize)
      ],
    );
  }
}