import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool beingDragged = false;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment(-0.8, 0.9);

  Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    // chain an animation/movement to the controller
    _animation = AlignmentTween(
      begin: _dragAlignment,
      end: Alignment(-0.8, 0.9)
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn
      )
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 60,
      stiffness: 10,
      damping: 3,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });

//    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          beingDragged = true;
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            0,
          );
        });
        if(_dragAlignment.x >= 0.75) {
          print('payment done!');
        }
      },
      onPanEnd: (details) {
        setState(() {
          beingDragged = false;
        });
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5),
//        width: MediaQuery.of(context).size.width,
            alignment: _dragAlignment,
            child: widget.child,
          ),
          Positioned(
            bottom: 37,
            left: 146,
            child: Text(
              beingDragged ? '' : 'Slide to pay',
              style: TextStyle(
                color: Colors.white30,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ]
      ),
    );
  }
}