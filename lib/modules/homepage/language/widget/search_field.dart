import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageSearchField extends StatefulWidget {
  final String hintText;

  const LanguageSearchField({required this.hintText, super.key});

  @override
  State<LanguageSearchField> createState() => _LanguageSearchFieldState();
}

class _LanguageSearchFieldState extends State<LanguageSearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD7D7D7),
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD7D7D7),
          )),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ),
    );
  }
}
