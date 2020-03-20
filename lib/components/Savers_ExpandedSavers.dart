import 'package:euphoria/components/AvailableBalance.dart';
import 'package:euphoria/components/ExpandedSavers_SingleTransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ExpandedSavers extends StatelessWidget {

  final String transactionName;
  final double transactionAmount;
  final String emojiName;
  final String date;

  ExpandedSavers({
    this.transactionName,
    this.transactionAmount,
    this.emojiName,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              elevation: 0,
              backgroundColor: Color(0xff23262B),
            ),
          ),
        ),
        backgroundColor: Color(0xff23262B),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              AvailableBalance(
                balance: '1000',
                label: 'saved',
              ),
              SizedBox(height: 20,),
              SingleTransaction(
                transactionAmount: 145,
                transactionName: 'Work Salary',
                date: 'THU 19 MARCH',
                emojiName: 'coffee',
                isAdd: true,
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
                transactionName: 'Mortgage',
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
            ],
          ),
        )
    );
  }
}