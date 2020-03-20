import 'package:flutter/material.dart';
import 'package:euphoria/components/AvailableBalance.dart';
import 'package:euphoria/components/PaymentsActionBar.dart';
import 'package:euphoria/components/PaymentHistory.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'package:euphoria/screens/PaySomeone.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AvailableBalance(
            balance: "437.6",
            label: "available",
          ),
          StickyListItem(
            header: PaymentsActionBar(
              goToPay: _goToPaySomeone()
            ),
            itemIndex: 0,
            content: PaymentHistory(),
          ),
//          PaymentHistory()
        ],
      ),
    );
  }
}

Route _goToPaySomeone() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PaySomeone(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.decelerate;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

typedef PaymentActionCallback = void Function(Route route);