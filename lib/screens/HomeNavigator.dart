import 'package:flutter/material.dart';
import 'package:euphoria/navigator_sections/Payments.dart';
import 'package:euphoria/navigator_sections/Activity.dart';
import 'package:euphoria/navigator_sections/Savers.dart';
import 'package:euphoria/navigator_sections/Profile.dart';



class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xff23262B),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff23262B),
              bottom: TabBar(
                indicator: BoxDecoration(),
                unselectedLabelColor: Colors.grey[700],
                labelColor: Colors.white70,
                tabs: <Widget>[
                  Tab(child: Text('Profile')),
                  Tab(child: Text('Activity')),
                  Tab(child: Text('Payments')),
                  Tab(child: Text('Savers')),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Profile(),
            Activity(),
            Payments(),
            Savers()
          ],
        )
      ),
    );
  }
}

final tab = new TabBar(tabs: <Tab>[
  new Tab(icon: new Icon(Icons.arrow_forward)),
  new Tab(icon: new Icon(Icons.arrow_downward)),
  new Tab(icon: new Icon(Icons.arrow_back)),
]);