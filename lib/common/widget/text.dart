import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  // final String fontweight;

  const HeadingText(
      {required this.text,
      this.color = const Color(0xFF0D276E),
      this.fontsize = 20,
      super.key});

  @override   
  Widget build (BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSans'
      ),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  // final String fontweight;

  const SubHeadingText(
      {required this.text,
      this.color = const Color(0xFF888888),
      this.fontsize = 14,
      super.key});

  @override   
  Widget build (BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans'
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  // final String fontweight;

  const BodyText(
      {required this.text,
      this.color = const Color(0xFF666666),
      this.fontsize = 14,
      super.key});

  @override   
  Widget build (BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
        fontFamily: 'OpenSans'
      ),
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
  Widget build (BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
        fontFamily: 'OpenSans'
      ),
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
  Widget build (BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough,
        fontFamily: 'OpenSans'
      ),
    );
  }
}
