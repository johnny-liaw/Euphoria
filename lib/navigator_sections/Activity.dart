import 'package:euphoria/components/AvailableBalance.dart';
import 'package:euphoria/components/ExpandedSavers_SingleTransaction.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            AvailableBalance(
              balance: "456",
              label: "available",
            ),
            SizedBox(height: 20,),
            SingleTransaction(
              transactionAmount: 4.7,
              transactionName: 'Starbucks Coffee',
              date: 'THU 19 MARCH',
              emojiName: 'coffee',
              isAdd: false,
            ),
            SingleTransaction(
              transactionAmount: 250,
              transactionName: 'Monthly Bonus',
              date: 'SUN 12 MARCH',
              emojiName: 'moneybag',
              isAdd: true,
            ),
            SingleTransaction(
              transactionAmount: 250,
              transactionName: 'Utilities',
              date: 'MON 9 MARCH',
              emojiName: 'house',
              isAdd: false,
            ),
            SingleTransaction(
              transactionAmount: 1000,
              transactionName: 'Travel Reimbursement',
              date: 'TUE 1 MARCH',
              emojiName: 'airplane',
              isAdd: true,
            ),
            SingleTransaction(
              transactionAmount: 250,
              transactionName: 'Airport Transport',
              date: 'THU 19 MARCH',
              emojiName: 'oncoming_taxi',
              isAdd: false,
            ),
            SingleTransaction(
              transactionAmount: 56.4,
              transactionName: 'Brunch @ Brunswick',
              date: 'SAT 20 FEB',
              emojiName: 'bento',
              isAdd: false,
            ),
            SingleTransaction(
              transactionAmount: 76.5,
              transactionName: 'Myki Pass',
              date: 'SAT 20 FEB',
              emojiName: 'bullettrain_front',
              isAdd: false,
            ),
          ],
        )
    );
  }
}
