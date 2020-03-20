import 'package:flutter/material.dart';
import 'package:euphoria/components/GradientText.dart';

class AvailableBalance extends StatelessWidget {

  AvailableBalance({
    this.balance,
    this.label
  });

  final String balance;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Text(
            '\$$balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700
            ),
          ),
          GradientText(
            text: '${label}',
            gradient: LinearGradient(colors: [
              Color(0xffCA80E4),
              Colors.deepOrange,
            ]),
            textStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      )
    );
  }
}
