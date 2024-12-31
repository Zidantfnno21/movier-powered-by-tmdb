import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:marquee/marquee.dart';  // Import the marquee package

class DynamicSlidingText extends StatefulWidget {
  final String text;
  final double maxWidth;
  final TextStyle style;
  final bool enableScrolling;
  final Duration scrollDuration;
  final double blankSpace;

  const DynamicSlidingText({
    super.key,
    required this.text,
    required this.maxWidth,
    required this.style,
    this.enableScrolling = true,
    this.scrollDuration = const Duration(seconds: 5),
    this.blankSpace = 20.0,
  });

  @override
  State<DynamicSlidingText> createState() => _DynamicSlidingTextState();
}

class _DynamicSlidingTextState extends State<DynamicSlidingText> {
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    _calculateTextWidth();
  }

  @override
  void didUpdateWidget(DynamicSlidingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.maxWidth != oldWidget.maxWidth || widget.text != oldWidget.text) {
      _calculateTextWidth();
    }
  }

  // Calculate the width of the text to determine scrolling behavior
  void _calculateTextWidth() {
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: widget.text, style: widget.style),
        maxLines: 1,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left
    )..layout();

    setState(() {
      textWidth = textPainter.size.width;
      textHeight = textPainter.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If scrolling is not enabled or text fits within max width, just show the text without animation
    if (!widget.enableScrolling || textWidth <= widget.maxWidth) {
      return AutoSizeText(
        widget.text,
        style: widget.style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    // If scrolling is enabled and text exceeds the available width, use Marquee for scrolling
    return _wrapWithStuff(
        Marquee(
          text: widget.text,
          style: widget.style,
          velocity: 50.0,  // Speed of scrolling
          scrollAxis: Axis.horizontal,  // Horizontal scrolling
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: widget.blankSpace,  // Space after the text
          pauseAfterRound: const Duration(seconds: 1),  // Pause after each round of scrolling// Start padding
          accelerationDuration: const Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
          textDirection: TextDirection.ltr,
        ),
    );
  }
  
  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(height:textHeight,width: widget.maxWidth, color: Colors.transparent, child: child),
    );
  }
}
