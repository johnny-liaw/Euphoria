import 'package:flutter/material.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        width: 120,
        duration: const Duration(milliseconds: 70),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .3),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? Color(0xff3a3f47) : Color(0xff2e3239),
              ],
              stops: [
                0.0,
                .25,
                .75,
                1.0,
              ]),
          boxShadow: _isPressed ? null : [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(-2, -2),
              color: color.mix(Colors.white12, .6),
            ),
            BoxShadow(
              blurRadius: 7,
              offset: Offset(2, 2),
              color: color.mix(Colors.black, 1),
            )
          ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}

extension ColorUtils on Color {
Color mix(Color another, double amount) {
  return Color.lerp(this, another, amount);
}
}