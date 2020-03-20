import 'package:flutter/material.dart';
import 'package:euphoria/components/SinglePayment.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: SizedBox(height: 65),
        ),
        SinglePayment(
          isReceived: false,
          receiver: "megan",
          sender: "johnny",
          amount: 12,
          description: "1917 movie",
        ),
        SinglePayment(
          isReceived: true,
          receiver: "johnny",
          sender: "ellie",
          amount: 75.6,
          description: "fried chicken",
        ),
        SinglePayment(
          isReceived: true,
          receiver: "johnny",
          sender: "kendrick",
          amount: 12,
          description: "kbbq at glen waverley",
        ),
        SinglePayment(
          isReceived: false,
          receiver: "ashley",
          sender: "johnny",
          amount: 760,
          description: "NZ plane tickets",
        ),
        SinglePayment(
          isReceived: false,
          receiver: "isabel",
          sender: "johnny",
          amount: 1200,
          description: "budapest hostel",
        ),
        SinglePayment(
          isReceived: false,
          receiver: "yuri",
          sender: "johnny",
          amount: 46,
          description: "kobe beef steak",
        ),
      ],
    );
  }
}
