import 'package:flutter/material.dart';
import 'package:euphoria/components/GradientText.dart';
import 'package:euphoria/components/UnicornOutlineButton.dart';

class Landing extends StatefulWidget {

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23262B),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 190),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.3, -1),
                    child: GradientText(
                      text: 'Euphoria',
                      gradient: LinearGradient(colors: [
                        Color(0xffCA80E4),
                        Colors.deepOrange,
                      ]),
                      textStyle: TextStyle(
                        fontSize: 55,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IntroText(),
                ],
              ),
            ),
            LandingButtons()
          ]
        )
    );
  }
}

class IntroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.4, -1),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width/2,
        child: Text(
                'A new digital banking experience, built for the people, by the people.',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey[700],
                  height: 1.175,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 3,
                ),
              ),
      ),
    );
  }
}

class LandingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 160),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          UnicornOutlineButton(
            strokeWidth: 2,
            radius: 14,
            gradient: LinearGradient(colors: [
              Colors.purple[300],
              Colors.blue[300]
            ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: GradientText(
                text: 'Sign Up',
                gradient: LinearGradient(colors: [
                  Colors.blue[300],
                  Colors.purple[300],
                ]),
                textStyle: TextStyle(
                  fontSize: 21,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {},
          ),
          UnicornOutlineButton(
            strokeWidth: 2,
            radius: 14,
            gradient: LinearGradient(colors: [
              Colors.deepOrange[200],
              Colors.teal[300]
            ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: GradientText(
                text: 'Log In',
                gradient: LinearGradient(colors: [
                  Colors.teal[300],
                  Colors.deepOrange[200],
                ]),
                textStyle: TextStyle(
                  fontSize: 21,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/payments');
            },
          )
        ],
      ),
    );
  }
}
