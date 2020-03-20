import 'package:flutter/material.dart';
import 'package:euphoria/components/PaymentsAction_HeaderText.dart';
import 'package:euphoria/components/PaymentsAction_MoneyInput.dart';
import 'package:euphoria/components/PaymentsAction_ToWho.dart';
import 'package:euphoria/components/PaymentsAction_ForWhat.dart';
import 'package:euphoria/components/PaymentsAction_SlideToPay.dart';


class PaySomeone extends StatefulWidget {
  @override
  _PaySomeoneState createState() => _PaySomeoneState();
}

class _PaySomeoneState extends State<PaySomeone> {

  String payment;
  String name;
  String event;
  double headerFontSize = 40;
  double amountFontSize = 40;
  double toFontSize = 40;
  double eventFontSize = 40;
  bool amountAutoFocus = false;
  bool nameAutoFocus = false;
  bool eventAutoFocus = false;
  bool paymentEntered = false;
  bool nameEntered = false;
  bool eventEntered = false;
  bool slideToPayBeingDragged = false;
  bool confirmedPayment = false;

  FocusNode _focus = new FocusNode();
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange(){
    debugPrint("Focus: "+_focus.hasFocus.toString());
  }

  void amountAdded(String val) {
    print("amount added!");
    setState(() {
      paymentEntered = true;
      payment = val;
      amountAutoFocus = false;
      nameAutoFocus = true;
      headerFontSize = 30;
    });
  }

  void nameAdded(String val) {
    print("name added!");
    setState(() {
      nameEntered = true;
      name = val;
      nameAutoFocus = false;
      eventAutoFocus = true;
    });
  }

  void forWhatAdded(String val) {
    print("for what added!");
    setState(() {
      event = val;
      nameAutoFocus = false;
      eventAutoFocus = false;
      eventEntered = true;
    });
  }

  void eventAdded(String val) {
    print("event added!");
    setState(() {
      nameEntered = true;
      event = val;
    });
  }

  void paymentConfirmed() {
    setState(() {
      confirmedPayment = !confirmedPayment;
    });
  }

  void paymentSlideDragged() {
    setState(() {
      slideToPayBeingDragged = !slideToPayBeingDragged;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0,
            backgroundColor: Color(0xff23262B),
          ),
        ),
      ),
      backgroundColor: Color(0xff23262B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: paymentEntered ? TextStyle(
              fontSize: 30
            ) : TextStyle(
              fontSize: 40
            ),
            child: HeaderText(
              header: 'Pay',
              color: Colors.blue,
            ),
          ),
          MoneyInput(
            amountAutoFocus: amountAutoFocus,
            hintText: "\$amount",
            onSubmit: amountAdded,
            focus: _focus
          ),
          Container(
            child: paymentEntered ? ToWho(
              nameAutoFocus: nameAutoFocus,
              onSubmit: nameAdded,
            ) : null,
          ),
          Container(
            child: nameEntered ? ForWhat(
              eventAutoFocus: eventAutoFocus,
              onSubmit: forWhatAdded,
            ) : null,
          ),
          Expanded(
            child: Container(
              child: eventEntered ? Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 17,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white30,
                        )
                      ),
                      width: MediaQuery.of(context).size.width-40,
                      height: 60,
                      child: null,
                    ),
                  ),
                  DraggableCard(
                      child: Image(
                          width: 70,
                          image: AssetImage('lib/assets/mastercard_logo.png')
                      )
                  ),
                ],
              ) : null,
            ),
          ),
        ],
      )
    );
  }
}