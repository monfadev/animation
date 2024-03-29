part of 'widgets.dart';

class TextDelayedAnimation extends StatefulWidget {
  final Widget child;
  final int? delayedAnimation;
  final double aniOffsetX;
  final double aniOffsetY;
  final int aniDuration;
  static bool disableButton = true;
  const TextDelayedAnimation({Key? key, required this.delayedAnimation, required this.aniOffsetX, required this.aniOffsetY, required this.aniDuration, required this.child}) : super(key: key);
  @override
  _TextDelayedAnimationState createState() => _TextDelayedAnimationState();
}

class _TextDelayedAnimationState extends State<TextDelayedAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: widget.aniDuration));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _controller!);
    _animationOffset = Tween<Offset>(begin: Offset(widget.aniOffsetX, widget.aniOffsetY), end: Offset.zero).animate(curve);

    if (widget.delayedAnimation == null) {
      _controller!.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayedAnimation!), () {
        _controller!.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset!,
        child: widget.child,
      ),
      opacity: _controller!,
    );
  }
}
