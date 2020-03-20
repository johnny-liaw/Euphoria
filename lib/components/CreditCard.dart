import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:euphoria/components/GradientText.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    _animation = Tween(end: 1, begin: 0).animate(_controller)..addListener(() {
      setState(() {});
    })..addStatusListener((status) {
      _animationStatus = status;
    });;
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        child: Container(
          width: MediaQuery.of(context).size.width-50,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1,0.9],
                colors: [
                  Color(0xff20BDFF),
                  Color(0xff5433FF),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: Colors.white12
              )
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 52,
                left: 40,
                child: Container(
                    width: 45,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('lib/assets/cardchip3.png')
                        )
                    )
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/assets/mastercard_logo.png')
                        )
                    )
                ),
              ),
              Positioned(
                bottom: 57,
                left: 40,
                child: Text(
                  '1111 2222 3333 4444',
                  style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'consolas',
                      color: Colors.white70,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Positioned(
                bottom: -5,
                left: -2,
                child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.content_copy,
                      color: Colors.white70,
                      size: 20,
                    ),
                    label: Text(
                      'Copy BSB/Acc No.',
                      style: TextStyle(
                          color: Colors.white70
                      ),
                    )
                ),
              ),
              Positioned(
                bottom: -5,
                right: -6,
                child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.warning, size: 20,color: Colors.white70,),
                    label: Text(
                      'Report Stolen',
                      style: TextStyle(
                        color: Colors.white70
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
      back: Container(
        child: Container(
      width: MediaQuery.of(context).size.width-50,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            child: Container(
              color: Color(0xffD3CCE3),
              width: MediaQuery.of(context).size.width-50,
              height: 30
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Text(
              'Expiry: 01/35',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'CCV: 123',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              ),
            ),
          ),
          Positioned(
            top: 108,
            right: -25,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(90 / 360),
              child: GradientText(
                text: 'Euphoria',
                gradient: LinearGradient(colors: [
                  Color(0xffCA80E4),
                  Colors.deepOrange,
                ]),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
    ),
      ),
    );
  }
}
