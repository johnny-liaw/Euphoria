import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForWhat extends StatelessWidget {

  final Function onSubmit;
  final bool eventAutoFocus;

  ForWhat({
    this.onSubmit,
    this.eventAutoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ForWhatInput(
        eventAutoFocus: eventAutoFocus,
        hintText: "for?",
        onSubmit: onSubmit,
      ),
    );
  }
}

class ForWhatInput extends StatelessWidget {

  final String hintText;
  final Function onSubmit;
  final Color cursorColor;
  final double cursorWidth;
  final TextAlign textAlign;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color hintStyleColor;
  final bool eventAutoFocus;

  ForWhatInput({
    @required this.hintText,
    @required this.onSubmit,
    this.cursorColor = Colors.white,
    this.cursorWidth = 3,
    this.textAlign = TextAlign.center,
    this.fontColor = Colors.white,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w900,
    this.hintStyleColor = Colors.white12,
    this.eventAutoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: eventAutoFocus,
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
        if(oldValue.text.startsWith("for ")) {
          return TextEditingValue(
            text: '${oldValue.text}${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end,
            ),
          );
        } else {
          return TextEditingValue(
            text: 'for ${oldValue.text}${newValue.text.substring(newValue.text.length-1)}',
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
