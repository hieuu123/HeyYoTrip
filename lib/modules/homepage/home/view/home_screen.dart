import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/extensions/widget_extensions.dart';
import 'package:heyyo_trip/common/widget/appbar.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/common/value/app_value.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/home_widget.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/category_section.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/place_section.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/tour_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          const HeaderNav(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubHeadingText(
                        text: 'Popular Deals',
                        fontsize: 18,
                        color: Color(0xFF333333),
                      ),
                      SubHeadingText(
                        text: 'See more',
                        fontsize: 16,
                        color: Color(0xFF3982D1),
                      ),
                    ],
                  ).makePadding(left: 15, top: 20, right: 15, bottom: 16),
                  CategorySection(
                      categories: categories, promotionData: dealsData),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(icons1.length, (index) {
                        return Row(
                          children: [
                            CustomIconWithTitle(
                                icon1: icons1[index],
                                icon2: icons2[index],
                                title: titles[index]),
                            if (index < icons1.length - 1)
                              const SizedBox(
                                width: 10.0,
                              )
                          ],
                        );
                      }),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, bottom: 16),
                        child: SubHeadingText(
                          text: 'Top Destinations In Viet Nam',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  const PromotionList(
                    promotionData: [
                      [
                        "assets/images/top-destination.png",
                        "assets/images/top-destination.png",
                        "assets/images/top-destination.png",
                      ],
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 15.0, bottom: 16),
                        child: SubHeadingText(
                          text: 'Popular Places For You',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  PlaceSection(categories: placeTitle, placeData: placeData),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, bottom: 16, top: 20),
                        child: SubHeadingText(
                          text: 'Flights for the cheapest rates',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  PromotionList(
                    promotionData: flights,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, bottom: 16, top: 20),
                        child: SubHeadingText(
                          text: 'Featured tours for you',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  TourSection(tourData: tourData),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SecondaryButton(
                      text: 'See More Tours',
                      onPressed: () {},
                      textColor: const Color(0xFF3982D1),
                      color: Colors.white,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, bottom: 16, top: 20),
                        child: SubHeadingText(
                          text: 'Popular Destinations Outside Vietnam',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  PromotionList(
                    promotionData: popularDestination,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, bottom: 20, top: 40),
                        child: Column(
                          children: [
                            SubHeadingText(
                              text: 'Travel Ticket Set With Cryptocurrency',
                              fontsize: 18,
                              color: Color(0xFF333333),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      travelTicket,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(coinList.length, (index) {
                        return SvgPicture.asset(coinList[index]);
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SecondaryButton(
                      text: 'Coin listing',
                      onPressed: () {},
                      textColor: const Color(0xFF3982D1),
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingText(
                          text: 'Travel Guide and Tips',
                          fontsize: 18,
                          color: Color(0xFF333333),
                        ),
                        SubHeadingText(
                          text: 'See more',
                          fontsize: 16,
                          color: Color(0xFF3982D1),
                        ),
                      ],
                    ),
                  ),
                  PromotionList(
                    promotionData: travelGuide,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
