import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final bool isChosen;
  final bool? isCenter;
  // final String fontweight;

  const HeadingText(
      {required this.text,
      this.color = const Color(0xFF0D276E),
      this.fontsize = 20,
      this.isChosen = true,
      this.isCenter = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter! ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: isChosen ? FontWeight.w700 : FontWeight.w400,
          fontFamily: 'OpenSans'),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final bool isChosen;
  // final String fontweight;
  final TextOverflow? overflow;
  final int? maxLines;

  const SubHeadingText(
      {required this.text,
      this.color = const Color(0xFF888888),
      this.fontsize = 14,
      this.isChosen = true,
      this.overflow,
      this.maxLines,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: isChosen ? FontWeight.w600 : FontWeight.w400,
          fontFamily: 'OpenSans'),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final bool? isCenter;

  // final String fontweight;

  const BodyText(
      {required this.text,
      this.color = const Color(0xFF666666),
      this.fontsize = 14,
      this.isCenter = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter! ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: FontWeight.w400,
          fontFamily: 'OpenSans'),
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  // final String fontweight;

  const LinkText(
      {required this.text,
      this.color = const Color(0xFF3982D1),
      this.fontsize = 14,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: FontWeight.w400,
          fontFamily: 'OpenSans'),
    );
  }
}

class LineThroughText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  // final String fontweight;

  const LineThroughText(
      {required this.text,
      this.color = const Color(0xFF666666),
      this.fontsize = 14,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.lineThrough,
          fontFamily: 'OpenSans'),
    );
  }
}

class StrokeText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color textColor;
  final Color strokeColor;
  final double strokeWidth;
  final bool hasShadow;
  final double xOffset;
  final double yOffset;
  final double blurRadius;
  final bool hasStroke;

  const StrokeText({
    super.key,
    required this.text,
    required this.fontFamily,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.left,
    this.textColor = Colors.white,
    this.strokeColor = const Color(0xFF3982D1),
    this.strokeWidth = 1.5,
    this.hasShadow = true,
    this.xOffset = 2.0,
    this.yOffset = 2.0,
    this.blurRadius = 2.0,
    this.hasStroke = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke layer
        hasStroke
            ? Text(
                text,
                textAlign: textAlign,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = strokeWidth + 3
                    ..color = strokeColor,
                ),
              )
            : SizedBox(),
        // Fill + optional shadow
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(xOffset, yOffset),
                      blurRadius: blurRadius,
                      color: const Color.fromRGBO(0, 0, 0, 0.3),
                    )
                  ]
                : null,
          ),
        ),
      ],
    );
  }
}
