import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToWho extends StatelessWidget {

  final Function onSubmit;
  final bool nameAutoFocus;

  ToWho({
    this.onSubmit,
    this.nameAutoFocus
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: NameInput(
        hintText: "to who?",
        onSubmit: onSubmit,
        nameAutoFocus: nameAutoFocus
      ),
    );
  }
}

class NameInput extends StatelessWidget {

  final String hintText;
  final Function onSubmit;
  final Color cursorColor;
  final double cursorWidth;
  final TextAlign textAlign;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color hintStyleColor;
  final bool nameAutoFocus;

  NameInput({
    @required this.hintText,
    @required this.onSubmit,
    this.cursorColor = Colors.greenAccent,
    this.cursorWidth = 3,
    this.textAlign = TextAlign.center,
    this.fontColor = Colors.greenAccent,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w900,
    this.hintStyleColor = Colors.white12,
    this.nameAutoFocus
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: nameAutoFocus,
      onSubmitted: onSubmit,
      cursorColor: cursorColor,
      cursorWidth: cursorWidth,
      textAlign: textAlign,
      style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontWeight: fontWeight
      ),
      decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: TextStyle(
              color: hintStyleColor
          )
      ),
      inputFormatters: [
        MaskedTextInputFormatter(),
      ],
    );;
  }
}


class MaskedTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//    print("triggered, old value: ${oldValue.text}, new value; ${newValue.text}");
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(oldValue.text.startsWith("to @")) {
          return TextEditingValue(
            text: '${oldValue.text}${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end,
            ),
          );
        } else {
          return TextEditingValue(
            text: 'to @${oldValue.text}${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 4,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
