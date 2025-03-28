import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/search_field.dart';

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
        // alignment: Alignment.bottomCenter,
        children: [
          Row(
            children: [
              SizedBox(
                width: maxWidth,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 30,
                      left: 16,
                      child: SizedBox(
                        width: maxWidth / 3.2,
                        child: Image.asset(
                          'assets/images/hotel-search-banner-1.png',
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: maxWidth - maxWidth / 3.2,
                        child: Image.asset(
                          'assets/images/hotel-search-banner-2.png',
                          color: const Color(0xFF76A4D0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 60,
              left: maxWidth / 2.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StrokeText(
                    text: 'Chào Hè Rực Rỡ',
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
                    text: 'Giảm Giá Hết Cỡ',
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
                              'assets/icons/hotel-search-banner.svg'),
                          const Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: Row(
                              children: [
                                StrokeText(
                                  text: 'Voucher lên đến',
                                  fontFamily: 'Quicksand',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  hasShadow: false,
                                  hasStroke: false,
                                  textColor: Color(0xFF3982D1),
                                ),
                                SizedBox(width: 7),
                                StrokeText(
                                  text: '250k',
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
      height: 485,
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
