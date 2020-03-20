import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width-50,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Colors.white54
            )
        ),
      ),
        Positioned(
          top: 70,
          left: 10,
          child: Container(
            width: 323,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.white30),
                )
            ),
            child: FlatButton(
                onPressed: (){},
                child: Text(
                  '${EmojiParser().getName('female-astronaut').code}   Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: Container(
            width: 323,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.white30),
                )
            ),
            child: FlatButton(
                onPressed: (){},
                child: Text(
                  '${EmojiParser().getName('credit_card').code}   Card',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          child: Container(
            width: 323,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.white30),
                )
            ),
            child: FlatButton(
                onPressed: (){},
                child: Text(
                  '${EmojiParser().getName('money_with_wings').code}   Payments',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 10,
          child: Container(
            width: 323,
            child: FlatButton(
                onPressed: (){},
                child: Text(
                  '${EmojiParser().getName('heart').code}   Refer a friend',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
        ),
    ]
    );
  }
}
