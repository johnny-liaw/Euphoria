import 'package:euphoria/components/AvailableBalance.dart';
import 'package:euphoria/components/Savers_ExpandedSavers.dart';
import 'package:euphoria/components/Savers_saversAction.dart';
import 'package:flutter/material.dart';
import 'package:euphoria/components/Savers_SingleSaver.dart';

class Savers extends StatefulWidget {

  @override
  _SaversState createState() => _SaversState();
}

class _SaversState extends State<Savers> {

  @override
  void initState() {
    super.initState();
  }

  double travelAmount = 1000;
  final double savingsAmount = 900;
  final double hawaiiAmount = 200;
  final double spaceAmount = 100;
  double totalSaved = 2200;

  addCallBack(double value) {
    setState(() {
      travelAmount += value;
      totalSaved += value;
    });
  }

  minusCallBack(double value) {
    setState(() {
      travelAmount -= value;
      totalSaved -= value;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 5),
              child: AvailableBalance(
                balance: "$totalSaved",
                label: "saved",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(_goToPaySomeone());
              },
              child: SingleSaver(
                onAdd: () {
                  Navigator.of(context).push(_goToSaversAction(addCallBack, true));
                },
                onMinus: () {
                  Navigator.of(context).push(_goToSaversAction(minusCallBack, false));
                },
                saverName: 'Travel',
                saverAmount: travelAmount,
                emoji: 'airplane',
                decoration: orangeDecoration,
              ),
            ),
            SingleSaver(
              saverAmount: savingsAmount,
              saverName: 'Savings',
              emoji: 'moneybag',
              decoration: blueDecoration,
            ),
            SingleSaver(
              saverAmount: hawaiiAmount,
              saverName: 'Hawaii',
              emoji: 'sunny',
              decoration: greenDecoration,
            ),
            SingleSaver(
              saverAmount: spaceAmount,
              saverName: 'Space Vacation',
              emoji: 'rocket',
              decoration: darkDecoration,
            )
          ]
      );
    }
  }

  BoxDecoration orangeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [
        Color(0xffFF9534),
        Color(0xffff441e),
      ],
    ),
  );

  BoxDecoration blueDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [
        Color(0xff40BBD6),
        Color(0xff026BCD),
      ],
    ),
  );

  BoxDecoration greenDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [
        Color(0xffA2B267),
        Color(0xff799F0C),
      ],
    ),
  );

  BoxDecoration darkDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [
        Color(0xff2C5364),
        Color(0xff203A43),
      ],
    ),
  );

  Route _goToPaySomeone() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ExpandedSavers(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.decelerate;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _goToSaversAction(Function callBack, bool addAction) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SaversAction(
            saversActionIsAdd: addAction,
            saversCallback: callBack,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.decelerate;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
}


