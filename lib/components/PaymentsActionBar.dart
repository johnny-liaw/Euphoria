import 'package:flutter/material.dart';

class PaymentsActionBar extends StatefulWidget {

  PaymentsActionBar({
    this.goToPay
  });

  final Route goToPay;

  @override
  _PaymentsActionBarState createState() => _PaymentsActionBarState();
}

class _PaymentsActionBarState extends State<PaymentsActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8, 0.9],
          colors: [
            Color(0xff23262B).withOpacity(0.8),
            Color(0xff23262B).withOpacity(0.05),
            Color(0xff23262B).withOpacity(0),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
            minWidth: 100,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              ),
              color: Color(0xff3A414E),
              child: Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(widget.goToPay);
              },
            ),
          ),
          ButtonTheme(
            minWidth: 100,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
              ),
              color: Color(0xff3A414E),
              child: Text(
                'Request',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 100,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
              ),
              color: Color(0xff3A414E),
              child: Text(
                'Pending',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

