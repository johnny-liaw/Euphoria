import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {

  final String header;
  final Color color;
  double fontSize;

  HeaderText({
    @required this.header,
    @required this.color,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Let's ",
              ),
              TextSpan(
                  text: header,
                  style: TextStyle(
                      color: color
                  )
              ),
            ]
        )
    );
  }
}
