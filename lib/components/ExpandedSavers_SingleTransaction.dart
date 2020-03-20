import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class SingleTransaction extends StatelessWidget {

  final String transactionName;
  final double transactionAmount;
  final String emojiName;
  final String date;
  final bool isAdd;

  SingleTransaction({
    this.transactionName,
    this.transactionAmount,
    this.emojiName,
    this.date,
    this.isAdd
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width-50,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
//                  border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width-50,
            height: 25,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6)
            ),
          ),
          Positioned(
            top: 7,
            left: 13,
            child: Text(
              '$date',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1
              ),
            ),
          ),
          Positioned(
            top: 28,
            left: 13,
            child: Text(
              '${EmojiParser().getName('$emojiName').code} ',
              style: TextStyle(
                  fontSize: 30
              ),
            ),
          ),
          Positioned(
            top: 38,
            left: 60,
            child: Text(
              '$transactionName',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Positioned(
            top: 38,
            right: 20,
            child: Text(
              '${isAdd ? '+' : '-'}\$$transactionAmount',
              style: TextStyle(
                  fontSize: 15,
                  color: isAdd ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}
