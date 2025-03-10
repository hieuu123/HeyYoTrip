import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String prefixIcon;
  final String suffixIcon;
  final String? Function(String?)? validator;
  // final Function(String)? onChanged;

  const AppTextFormField(
      {required this.prefixIcon,
      this.hintText = '',
      required this.controller,
      this.isPassword = false,
      this.suffixIcon = 'assets/icons/blank.svg',
      this.validator,
      super.key});

  @override
  State<AppTextFormField> createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends State<AppTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword && !isPasswordVisible,
      decoration: InputDecoration(
          prefixIcon: SizedBox(
            height: 32,
            width: 32,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                widget.prefixIcon,
                width: 10,
              ),
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: isPasswordVisible
                  ? SvgPicture.asset('assets/icons/eye-off.svg')
                  : SvgPicture.asset('assets/icons/eye-open.svg'),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
              : SizedBox(
                  height: 32,
                  width: 32,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(widget.suffixIcon, width: 10),
                  ),
                ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF666666),
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: Color(0xFFD7D7D7),
          ))),
    );
  }
}
