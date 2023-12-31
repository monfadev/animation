part of 'widgets.dart';

class ButtonAnimationImplementation extends StatefulWidget {
  final String buttonText;
  final Function() onTab;

  const ButtonAnimationImplementation({Key? key, required this.buttonText, required this.onTab}) : super(key: key);
  @override
  _ButtonAnimationImplementationState createState() => _ButtonAnimationImplementationState();
}

class _ButtonAnimationImplementationState extends State<ButtonAnimationImplementation> {
  bool _isPressed = false;
  double _scale = 0.986;
  List<PointerMoveEvent> events = [];

  void onPressedUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  void onPressedDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void onPointerMove(PointerMoveEvent event) {
    events.add(event);

    if (events.length > 20) {
      setState(() {
        events = [];
        _isPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Listener(
        onPointerUp: onPressedUp,
        onPointerDown: onPressedDown,
        onPointerMove: onPointerMove,
        child: _isPressed
            ? Transform.scale(
                scale: _scale,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.shade900,
                        Colors.green.shade800,
                        Colors.green.shade800,
                        Colors.green.shade800,
                        Colors.green.shade800,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.green.shade400,
                      Colors.green.shade500,
                      Colors.green.shade600,
                      Colors.green.shade700,
                      Colors.green.shade800,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
