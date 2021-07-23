part of'widgets.dart';

class ButtonAnimationImplementation extends StatefulWidget {
  final String buttonText;
  final Function() onTab;

  const ButtonAnimationImplementation({Key? key, required this.buttonText, required this.onTab})
      : super(key: key);
  @override
  _ButtonAnimationImplementationState createState() =>
      _ButtonAnimationImplementationState();
}

class _ButtonAnimationImplementationState
    extends State<ButtonAnimationImplementation> {
  bool isPressed = false;
  double _scale = 0.986;

  void onPressedUp(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }

  void onPressedDown(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      child: GestureDetector(
        onTap: widget.onTab,
        child: Listener(
          onPointerUp: onPressedUp,
          onPointerDown: onPressedDown,
          child: isPressed
              ? Transform.scale(
                  scale: _scale,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        widget.buttonText,
                        style: TextStyle(
                          color:whiteColor,
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: blueColor,
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
      ),
    );
  }
}
