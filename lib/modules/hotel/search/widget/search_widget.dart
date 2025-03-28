import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/home_widget.dart';
import 'package:heyyo_trip/common/value/app_value.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/category_section.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/place_section.dart';

class CustomIconSection extends StatelessWidget {
  const CustomIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 30),
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
    );
  }
}

class HotelSearchPopularDeals extends StatelessWidget {
  const HotelSearchPopularDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 20, right: 15, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingText(
                text: 'Popular Deals',
                fontsize: 16,
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
          left: 16,
          right: 0,
          promotionData: [
            [
              "assets/images/deal-1.png",
              "assets/images/deal-2.png",
              "assets/images/deal-3.png",
              "assets/images/deal-4.jfif"
            ],
          ],
        ),
      ],
    );
  }
}

class HotelSearchPopularPlaces extends StatelessWidget {
  const HotelSearchPopularPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15.0, bottom: 16),
              child: SubHeadingText(
                text: 'Popular Places For You',
                fontsize: 18,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
        PlaceSection(
          categories: placeTitle,
          placeData: placeData,
          hasButton: false,
          height: 376,
        ),
      ],
    );
  }
}

class HotelSearchTravelTicket extends StatelessWidget {
  const HotelSearchTravelTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(coinList.length, (index) {
              return SvgPicture.asset(coinList[index]);
            }),
          ),
        ),
      ],
    );
  }
}

class HotelSearchTravelGuide extends StatelessWidget {
  const HotelSearchTravelGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 16),
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
          promotionData: travelGuide, left: 16, right: 16,
        )
      ],
    );
  }
}
