import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconWithTitle extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String title;

  const CustomIconWithTitle(
      {required this.icon1,
      required this.icon2,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 50,
      width: (screenWidth - 50) / 3,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [SvgPicture.asset(icon1), SvgPicture.asset(icon2)],
          ),
          Positioned(
            left: 25,
            top: 5,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 5, right: 0, left: 25),
              width: ((screenWidth - 50) / 3) - 25,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Color(0xFF3982D1), width: 1.0),
                    right: BorderSide(color: Color(0xFF3982D1), width: 1.0),
                    bottom: BorderSide(color: Color(0xFF3982D1), width: 1.0),
                    left: BorderSide.none,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF3982D1),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}