import 'package:flutter/material.dart';

// this class defines a currency box
// Color, Widget and an onpressed function are required

class CurrencyBox extends StatelessWidget {
  CurrencyBox({required this.theColor, required this.theChild, this.theOnTapFunc});

  // instance variable
  final Color theColor;
  final Widget theChild;
  final VoidCallback? theOnTapFunc; // function as a variable..nullable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: theOnTapFunc,
      child: Container(
        height: 70,
        width: 70,
        child: theChild,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: theColor,

          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}