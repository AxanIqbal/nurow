import 'dart:async';

import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({
    Key? key,
    required this.text,
    this.textStyle,
    required this.counter,
  }) : super(key: key);
  final String text;
  final TextStyle? textStyle;
  final Function counter;

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<int> _characterCount;
  bool _isAnimationDone = false;
  bool _isAnimationDoneAfter = false;
  late Timer _isLoadingTimer;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _characterCount = StepTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.dispose();
          _isAnimationDone = true;
          _isLoadingTimer = Timer(const Duration(milliseconds: 500), () {
            _isAnimationDoneAfter = true;
          });
          widget.counter();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _isLoadingTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (context, child) {
        String text = widget.text.substring(0, _characterCount.value);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                text,
                style: widget.textStyle,
                maxLines: 2,
              ),
            ),
            if (_isAnimationDone && text != '' && text[text.length - 1] == ' ')
              if (_isAnimationDoneAfter)
                const Text("done")
              else
                const SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 2.0,
                  ),
                ),
          ],
        );
      },
    );
  }
}
