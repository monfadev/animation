part of 'widgets.dart';

class ButtonAnimation extends StatefulWidget {
  final Widget child;
  final int? delayTime;
  static bool disableButton = false;

  const ButtonAnimation({Key? key, this.delayTime, required this.child}) : super(key: key);
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          ButtonAnimation.disableButton = false;
        });
      } else {
        setState(() {
          ButtonAnimation.disableButton = true;
        });
      }
    });

    if (widget.delayTime == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayTime!), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
