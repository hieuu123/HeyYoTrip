import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class MapPlaceCard extends StatelessWidget {
  final String name;
  final int rate;
  final int comment;
  final String price;
  final int passenger;
  final int night;
  final bool isSelected;

  const MapPlaceCard(
      {required this.name,
      required this.rate,
      required this.comment,
      required this.price,
      required this.passenger,
      required this.night,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      width: maxWidth - 80,
      height: 160,
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xFF3982D1)),
              borderRadius: BorderRadius.circular(4))
          : null,
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: maxWidth / 3.45,
                height: 160,
                child: Image.asset(
                  'assets/images/popular-places-2.jfif',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset('assets/icons/favorite_border.svg'),
                  ))
            ],
          ),
          Expanded(
              child: Container(
            color: const Color(0xFFF8F8F8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SubHeadingText(
                          text: name,
                          fontsize: 16,
                          color: const Color(0xFF181818),
                        ),
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            rate,
                            (index) =>
                                SvgPicture.asset('assets/icons/star2.svg'),
                          ),
                          ...List.generate(
                            5 - rate,
                            (index) =>
                                SvgPicture.asset('assets/icons/nostar2.svg'),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const BodyText(
                            text: 'Excellent',
                            fontsize: 12,
                            color: Color(0xFF8A8A8A),
                          )
                        ],
                      ),
                      BodyText(
                        text: '($comment comment)',
                        fontsize: 12,
                        color: const Color(0xFF8A8A8A),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const BodyText(
                      text: 'Flight + Hotel',
                      fontsize: 12,
                      color: Color(0xFF666666),
                    ),
                    HeadingText(
                      text: price,
                      color: const Color(0xFF333333),
                      fontsize: 20,
                    ),
                    BodyText(
                      text: 'Price $passenger passenger(s), $night night(s)',
                      fontsize: 12,
                      color: const Color(0xFF666666),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
