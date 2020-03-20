import 'package:flutter/material.dart';

class Headshot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/elon.png')
              )
          )
      ),
    );
  }
}
