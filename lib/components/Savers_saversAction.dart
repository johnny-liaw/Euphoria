import 'package:flutter/material.dart';
import 'package:euphoria/components/PaymentsAction_HeaderText.dart';

import 'PaymentsAction_MoneyInput.dart';

class SaversAction extends StatefulWidget {

  SaversAction({
    this.saversCallback,
    this.saversActionIsAdd
  });

  final bool saversActionIsAdd;
  final Function saversCallback;

  @override
  _SaversActionState createState() => _SaversActionState();
}

class _SaversActionState extends State<SaversAction> {



  @override
  void initState() {
    super.initState();
  }

  void setAmount(String val) {
    print("setting amount! $val");
    widget.saversCallback(double.parse(val.substring(1)));
    Navigator.of(context).pop();
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              HeaderText(
                header: 'transfer ${widget.saversActionIsAdd ? "in" : "out"}',
                color: widget.saversActionIsAdd ? Colors.blue : Colors.deepOrange,
              ),
              MoneyInput(
                amountAutoFocus: true,
                hintText: "\$amount",
                onSubmit: setAmount,
              ),
            ],
          ),
        )
    );
  }
}