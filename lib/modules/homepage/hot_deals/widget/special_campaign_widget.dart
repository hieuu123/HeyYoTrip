import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/enum/hot_deals_enum.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/extension/hot_deals_extension.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/blocs/hot_deals_bloc.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/blocs/hot_deals_state.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/blocs/hot_deals_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/widget/place_section.dart';

class CampaignSelector extends StatelessWidget {
  const CampaignSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotDealsCategoryBloc, HotDealsCategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as HotDealsCategoryInitial).selectedIndex;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SizedBox(
            height: 45,
            child: Row(
              children: List.generate(
                SpecialCampaign.values.length,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index < 2 ? 10 : 0),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<HotDealsCategoryBloc>()
                            .add(HotDealsCategorySelected(index));
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: selectedIndex == index
                                ? const Color(0xFF0770CD)
                                : const Color(0xFFE1E1E1),
                            width: 1,
                          ),
                          color: selectedIndex == index
                              ? const Color(0xFFE6F0FA)
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              SpecialCampaign.values[index].icon,
                            ),
                            SubHeadingText(
                              text: SpecialCampaign.values[index].title,
                              color: const Color(0xFF0770CD),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CampaingnContent extends StatelessWidget {
  const CampaingnContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotDealsCategoryBloc, HotDealsCategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as HotDealsCategoryInitial).selectedIndex;
        // Lọc dữ liệu dựa trên selectedIndex
        var filteredData = SpecialCampaign.values[selectedIndex].campaigns;
        final maxHeight = MediaQuery.of(context).size.height;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: maxHeight - 405,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        height: 440,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: const Color(0xFFD7D7D7)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Image.asset(
                                  filteredData[index]['image'] ?? ''),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingText(
                                    text: filteredData[index]['title'] ?? '',
                                    fontsize: 18,
                                    color: const Color(0xFF4A5568),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: BodyText(
                                      text: filteredData[index]
                                              ['description'] ??
                                          '',
                                      fontsize: 14,
                                      color: const Color(0xFF4A5568),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Booking period: ',
                                                style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: filteredData[index]
                                                        ['time'] ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // softWrap: true,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: SecondaryButton(
                                          text: 'Get coupon',
                                          onPressed: () {
                                            GoRouter.of(context).push(
                                              '/special-campaign-details',
                                              extra: {
                                                'title': filteredData[index]
                                                    ['title'],
                                                'image': filteredData[index]
                                                    ['image'],
                                              },
                                            );
                                          },
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PlaceListView extends StatelessWidget {
  final List<List<Map<String, dynamic>>> placeData;

  const PlaceListView({super.key, required this.placeData});

  @override
  Widget build(BuildContext context) {
    final flattenedPlaceData = placeData.expand((places) => places).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        shrinkWrap: true, // Để ListView co lại theo nội dung
        physics: const BouncingScrollPhysics(),
        itemCount: flattenedPlaceData.length,
        itemBuilder: (context, index) {
          final place = flattenedPlaceData[index];

          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
            child: PlaceCard(
              width: double.infinity,
              image: place['image'] as String,
              place: place['place'] as String,
              title: place['title'] as String,
              discountPercent: place['discountPercent'] as String,
              rate: place['rate'] as double,
              numRate: place['numRate'] as int,
              originalPrice: place['originalPrice'] as String,
              finalPrice: place['finalPrice'] as String,
            ),
          );
        },
      ),
    );
  }
}