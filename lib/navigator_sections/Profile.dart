import 'package:flutter/material.dart';
import 'package:euphoria/components/Headshot.dart';
import 'package:euphoria/components/CreditCard.dart';
import 'package:euphoria/components/ProfileSettings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20), child: Headshot()),
          Padding(
            padding: EdgeInsets.only(top: 4, bottom: 25),
            child: Text(
              '@starman-elon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),
            ),
          ),
          CreditCard(),
          ProfileSettings()
        ]
    );
  }
}
