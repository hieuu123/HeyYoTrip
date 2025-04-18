import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/flight/search/widget/search_field.dart';

class SearchBanner extends StatelessWidget {
  const SearchBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 185,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF3982D1), Color(0xFF004E92)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: SizedBox(
                  width: maxWidth - 30,
                  child: Image.asset(
                    'assets/images/flight-search-banner.png',
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 60,
              left: maxWidth / 2.85 + 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StrokeText(
                    text: 'Giờ Vàng',
                    fontFamily: 'Quicksand',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    xOffset: 1,
                    yOffset: 2,
                    strokeColor: Color(0xFF3982D1),
                    strokeWidth: 1,
                    blurRadius: 1,
                  ),
                  const StrokeText(
                    text: 'Cơ Hội Vàng',
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    xOffset: 2,
                    yOffset: 2,
                    strokeColor: Color(0xFF3982D1),
                    strokeWidth: 1.5,
                    blurRadius: 2,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 43),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/hotel-search-banner.svg', colorFilter: const ColorFilter.mode(Color(0xFF3982D1), BlendMode.srcIn)),
                          const Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: Row(
                              children: [
                                StrokeText(
                                  text: 'Săn ngay vé',
                                  fontFamily: 'Quicksand',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  hasShadow: false,
                                  hasStroke: false,
                                  textColor: Colors.white,
                                ),
                                SizedBox(width: 7),
                                StrokeText(
                                  text: '0đ',
                                  fontFamily: 'Pattaya',
                                  textColor: Colors.white,
                                  strokeColor: Color(0xFFFF851B),
                                  strokeWidth: 1.5,
                                  fontSize: 32,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: Colors.red,
      height: 600,
      width: maxWidth,
      child: Stack(
        children: [
          const SearchBanner(),
          Positioned(
              top: 155,
              left: 16,
              child: Column(
                children: [
                  const SearchField(),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: maxWidth - 32,
                    child: SecondaryButton(text: 'Search', onPressed: () {}, vertical: 12,))
                ],
              )),
        ],
      ),
    );
  }
}
