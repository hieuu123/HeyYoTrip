import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color color;
  final bool isReady;

  PrimaryButton({required this.text, this.textColor = const Color(0xFFFFFFFF), this.color = const Color(0xFF3982D1), 
    this.isReady = false, required this.onPressed, super.key});

  @override   
  State<PrimaryButton> createState() => PrimaryButtonState();
}

class PrimaryButtonState extends State<PrimaryButton> {
  @override  
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed, 
      child: Text('${widget.text}', style: TextStyle(
        color: Color(0xFFFFFFFF),
      ),),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => widget.isReady ? const Color(0xFF3982D1) : const Color(0xFFCFE2FF),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        )
      ),
    );
  }
}