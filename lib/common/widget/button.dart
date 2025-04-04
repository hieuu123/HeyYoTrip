import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color color;
  final bool isReady;

  const PrimaryButton(
      {required this.text,
      this.textColor = const Color(0xFFFFFFFF),
      this.color = const Color(0xFF3982D1),
      this.isReady = false,
      required this.onPressed,
      super.key});

  @override
  State<PrimaryButton> createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => widget.isReady ? widget.color : const Color(0xFFCFE2FF),
          ),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      child: SubHeadingText(
        text: widget.text,
        color: Colors.white,
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color color;
  final double vertical;
  final double horizontal;
  final Color borderColor;
  final double fontsize;
  // final bool isReady;

  const SecondaryButton(
      {required this.text,
      this.textColor = const Color(0xFFFFFFFF),
      this.color = const Color(0xFF3982D1),
      this.borderColor = const Color(0xFF3982D1),
      required this.onPressed,
      this.vertical = 0,
      this.horizontal = 0,
      this.fontsize = 16,
      super.key});

  @override
  State<SecondaryButton> createState() => SecondaryButtonState();
}

class SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          side: WidgetStateProperty.all(
              BorderSide(color: widget.borderColor, width: 1)),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => widget.color,
          ),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.vertical, horizontal: widget.horizontal),
        child: SubHeadingText(
          text: widget.text,
          color: widget.textColor,
          fontsize: widget.fontsize,
        ),
      ),
    );
  }
}
