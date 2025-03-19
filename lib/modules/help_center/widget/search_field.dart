import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpTextField extends StatelessWidget {
  const HelpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Type any question or keyword',
            hintStyle: const TextStyle(
                fontFamily: 'OpenSans', color: Color.fromARGB(80, 26, 32, 61)),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/icons/search.svg'),
            )),
      ),
    );
  }
}

class HelpSearchSection extends StatelessWidget {
  const HelpSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 185,
      child: Stack(children: [
        Positioned(
            top: 0,
            left: 42,
            child: SvgPicture.asset('assets/icons/help-center-bg1.svg')),
        Positioned(
            top: 10,
            right: 27,
            child: SvgPicture.asset('assets/icons/help-center-bg3.svg')),
        Positioned(
            top: 4,
            left: 105,
            child: SvgPicture.asset('assets/icons/help-center-bg2.svg')),
        Positioned(
          bottom: 22,
          left: 125,
          child: SvgPicture.asset('assets/icons/help-center-bg5.svg'),
        ),
        Positioned(
          bottom: 15,
          left: 128,
          child: SvgPicture.asset('assets/icons/help-center-bg4.svg'),
        ),
        Positioned(
          bottom: 55,
          right: 50,
          child: SvgPicture.asset('assets/icons/help-center-bg5.svg'),
        ),
        Positioned(
          bottom: 48,
          right: 52,
          child: SvgPicture.asset('assets/icons/help-center-bg4.svg'),
        ),
        const Center(child: HelpTextField())
      ]),
    );
  }
}