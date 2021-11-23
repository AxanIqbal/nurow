import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key, required this.text, this.textStyle})
      : super(key: key);
  final String text;
  final TextStyle? textStyle;

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> _characterCount;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _characterCount = StepTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.dispose();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        String text = widget.text.substring(0, _characterCount.value);
        return Text(
          text,
          style: widget.textStyle,
        );
      },
    );
  }
}
