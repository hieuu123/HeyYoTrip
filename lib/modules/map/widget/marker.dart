import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class MapMarker extends StatelessWidget {
  final String price;

  const MapMarker({required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/marker-container.svg',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/map-apartment.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 6),
                BodyText(
                  text: price,
                  color: const Color(0xFF3982D1),
                  fontsize: 14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
