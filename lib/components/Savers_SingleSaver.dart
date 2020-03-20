import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class SingleSaver extends StatefulWidget {

  final String saverName;
  final double saverAmount;
  final emoji;
  final BoxDecoration decoration;
  final Function onAdd;
  final Function onMinus;

  SingleSaver({
    this.saverAmount,
    this.saverName,
    this.emoji,
    this.decoration,
    this.onAdd,
    this.onMinus,
  });

  @override
  State<StatefulWidget> createState() {
    return SingleSaverState();
  }
}

class SingleSaverState extends State<SingleSaver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 100,
      width: MediaQuery.of(context).size.width-50,
      decoration: widget.decoration,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 14,
            left: 14,
            child: Text(
              '${EmojiParser().getName('${widget.emoji}').code} ${widget.saverName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 17,
            child: Text(
              '\$${widget.saverAmount}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),
            ),
          ),
          Positioned(
            bottom: 17,
            right: 17,
            child: GestureDetector(
              onTap: (){widget.onAdd();},
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white
                  )
                ),
                child: Icon(Icons.add, size: 23, color: Colors.white,)
              ),
            )
          ),
          Positioned(
              bottom: 17,
              right: 68,
              child: GestureDetector(
                onTap: (){widget.onMinus();},
                child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.white
                        )
                    ),
                    child: Icon(Icons.remove, size: 23, color: Colors.white,)
                ),
              )
          )
        ],
      )
    );
  }
}

