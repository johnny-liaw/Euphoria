import 'package:flutter/material.dart';

class SinglePayment extends StatelessWidget {

  SinglePayment({
    this.isReceived,
    this.receiver,
    this.sender,
    this.amount,
    this.description
  });

  final bool isReceived;
  final String receiver;
  final String sender;
  final double amount;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 200,
          constraints: BoxConstraints(
            minHeight: 100
          ),
          margin: EdgeInsets.only(
            bottom: 13,
            right: this.isReceived ? 0 : 20,
            left: this.isReceived ? 20 : 0
          ),
          decoration: this.isReceived ? receivedDecoration : sentDecoration,
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\$$amount ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: this.isReceived ? 'from ' : 'to ',
                    ),
                    TextSpan(
                      text: this.isReceived ? '@$sender ' : '@$receiver ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 'for ',
                    ),
                    TextSpan(
                      text: "$description",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                    ),
                  ]
                ),
              ),
            )
          ),
        ),
      ],
    );
  }
}

BoxDecoration sentDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1,0.9],
    colors: [
      Color(0xffFF9534),
      Color(0xffFF1E1E),
    ],
  ),
);

BoxDecoration receivedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1,0.9],
    colors: [
      Color(0xff40BBD6),
      Color(0xff026BCD),
    ],
  ),
);