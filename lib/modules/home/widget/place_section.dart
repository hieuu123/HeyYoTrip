import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/home/widget/category_section.dart';

class PlaceCard extends StatelessWidget {
  final String image;
  final String place;
  final String title;
  final String discountPercent;
  final double rate;
  final int numRate;
  final String originalPrice;
  final String finalPrice;
  final double? width;

  const PlaceCard(
      {required this.image,
      required this.place,
      required this.title,
      this.discountPercent = '',
      required this.rate,
      required this.numRate,
      this.originalPrice = '',
      required this.finalPrice,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    int star = rate.floor().toInt();
    int nostar = 5 - star;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFEDEDED), width: 1)),
      width: width ?? 285,
      // height: 365,
      child: Column(
        children: [
          SizedBox(
            width: width ?? 280,
            height: 185,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                  ]))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: BodyText(
                    text: place,
                    fontsize: 12,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 7.0, bottom: 7, right: 16),
                  child: BodyText(
                    text: title,
                    fontsize: 16,
                    color: const Color(0xFF242426),
                  ),
                ),
                Row(
                  children: [
                    BodyText(
                      text: rate.toString(),
                      color: const Color(0xFFFD7E14),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Row(
                      children: List.generate(star, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: SvgPicture.asset('assets/icons/star.svg'),
                        );
                      }),
                    ),
                    Row(
                      children: List.generate(nostar, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 6),
                          child: SvgPicture.asset('assets/icons/nostar.svg'),
                        );
                      }),
                    ),
                    BodyText(text: '($numRate)')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: LineThroughText(text: originalPrice),
                ),
                SubHeadingText(
                  text: finalPrice,
                  color: const Color(0xFFFD7E14),
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

class PlaceSection extends StatelessWidget {
  final List<String> categories;
  final List<List<Map<String, dynamic>>> placeData;

  const PlaceSection({required this.categories, required this.placeData, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySelector(categories: categories),
          const SizedBox(height: 16),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              int selectedIndex = (state as CategoryInitial).selectedIndex;
              List<Map<String, dynamic>> selectedPlaces =
                  placeData[selectedIndex];
              return SizedBox(
                height: 440,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedPlaces.length,
                          itemBuilder: (context, index) {
                            final place = selectedPlaces[index];
                            return Container(
                              margin: (index < selectedPlaces.length - 1)
                                  ? const EdgeInsets.only(right: 10)
                                  : null,
                              child: Column(
                                children: [
                                  PlaceCard(
                                    image: place['image'],
                                    place: place['place'],
                                    title: place['title'],
                                    discountPercent:
                                        place['discountPercent'] ?? '',
                                    rate: place['rate'],
                                    numRate: place['numRate'],
                                    originalPrice: place['originalPrice'] ?? '',
                                    finalPrice: place['finalPrice'],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.8,
                              child: SecondaryButton(
                            text:
                                'See More (${categories[selectedIndex]}) Properties',
                            onPressed: () {},
                            textColor: const Color(0xFF3982D1),
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}