import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class TourCard extends StatelessWidget {
  final String image;
  final String date;
  final String length;
  final String title;
  final String discountPercent;
  final double rate;
  final String originalPrice;
  final String finalPrice;

  const TourCard(
      {required this.image,
      required this.date,
      required this.length,
      required this.title,
      this.discountPercent = '',
      required this.rate,
      this.originalPrice = '',
      required this.finalPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFEDEDED), width: 1)),
      width: 285,
      // height: 365,
      child: Column(
        children: [
          SizedBox(
            width: 280,
            height: 185,
            child: Stack(children: [
              Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Stack(alignment: Alignment.center, children: [
                    SvgPicture.asset('assets/icons/discount-corner.svg'),
                    SubHeadingText(
                      text: '-$discountPercent%',
                      color: const Color(0xFFFFFFFF),
                      fontsize: 12,
                    )
                  ])),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 57,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8)),
                      color: Color(0xFFF8F9FA),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BodyText(
                          text: '${rate.toStringAsFixed(1)}/5',
                          color: const Color(0xFF242426),
                        ),
                        SvgPicture.asset('assets/icons/star.svg')
                      ],
                    ),
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        BodyText(
                          text: '$date - ',
                          color: const Color(0xFF242426),
                        ),
                        BodyText(text: length, color: const Color(0xFF242426))
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 7.0, bottom: 7, right: 16),
                  child: HeadingText(
                    text: title,
                    fontsize: 16,
                    color: const Color(0xFF242426),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      const BodyText(
                        text: 'Price: ',
                        color: Color(0xFF242426),
                      ),
                      LineThroughText(
                        text: originalPrice,
                        color: const Color(0xFF242426),
                      ),
                    ],
                  ),
                ),
                SubHeadingText(
                  text: finalPrice,
                  color: const Color(0xFFDC3545),
                  fontsize: 16,
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TourSection extends StatelessWidget {
  final List<Map<String, dynamic>> tourData;
  const TourSection({required this.tourData, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 405,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            itemCount: tourData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  TourCard(
                      image: tourData[index]['image'],
                      date: tourData[index]['date'],
                      length: tourData[index]['length'],
                      title: tourData[index]['title'],
                      rate: tourData[index]['rate'],
                      discountPercent: tourData[index]['discountPercent'],
                      originalPrice: tourData[index]['originalPrice'],
                      finalPrice: tourData[index]['finalPrice']),
                  if (index < tourData.length - 1)
                    const SizedBox(
                      width: 10,
                    ),
                ],
              );
            }),
      ),
    );
  }
}