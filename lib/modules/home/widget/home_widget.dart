import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/home/blocs/home_event.dart';
import 'package:heyyo_trip/modules/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
// import 'package:go_router/go_router.dart';

class CategorySection extends StatelessWidget {
  // final String sectionTitle;
  final List<String> categories;
  final List<List<String>> promotionData;

  const CategorySection(
      {
      // required this.sectionTitle,
      required this.categories,
      required this.promotionData,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySelector(categories: categories),
          const SizedBox(height: 16),
          PromotionList(promotionData: promotionData),
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  final List<String> categories;

  const CategorySelector({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as CategoryInitial).selectedIndex;
        double screenWidth = MediaQuery.of(context).size.width;
        double maxWidth = 415.0; // ✅ Giới hạn tối đa khi căn giữa
        bool shouldCenter =
            screenWidth > maxWidth; // ✅ Kiểm tra điều kiện căn giữa

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: shouldCenter
                ? Alignment.center
                : Alignment.centerLeft, // ✅ Căn giữa nếu > 415px
            child: SizedBox(
              width: shouldCenter
                  ? maxWidth
                  : double.infinity, // ✅ Giữ nguyên khi nhỏ, giới hạn khi lớn
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(categories.length, (index) {
                    bool isSelected = selectedIndex == index;
                    return Container(
                      decoration: BoxDecoration(
                        border: index < categories.length - 1
                            ? const Border(
                                right: BorderSide(
                                    color: Color(0xFFEDEDED), width: 1.0),
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          if (index > 0 && index < categories.length)
                            const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CategoryBloc>()
                                  .add(CategorySelected(index));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: BodyText(
                                text: categories[index],
                                color: isSelected
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF333333),
                              ),
                            ),
                          ),
                          if (index < categories.length - 1)
                            const SizedBox(width: 8),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PromotionList extends StatelessWidget {
  final List<List<String>> promotionData;

  const PromotionList({required this.promotionData, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as CategoryInitial).selectedIndex;
        List<String> selectedPromotions = promotionData[selectedIndex];

        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedPromotions.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: (index < selectedPromotions.length - 1)
                      ? const EdgeInsets.only(right: 10)
                      : null,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(selectedPromotions[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

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

class PlaceCard extends StatelessWidget {
  final String image;
  final String place;
  final String title;
  final String discountPercent;
  final double rate;
  final int numRate;
  final String originalPrice;
  final String finalPrice;

  const PlaceCard(
      {required this.image,
      required this.place,
      required this.title,
      this.discountPercent = '',
      required this.rate,
      required this.numRate,
      this.originalPrice = '',
      required this.finalPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    int star = rate.floor().toInt();
    int nostar = 5 - star;
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
