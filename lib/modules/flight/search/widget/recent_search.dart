import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/flight/search/extension/search_extension.dart';
import 'package:heyyo_trip/modules/flight/search/enum/search_enum.dart';

class RecentSearchCard extends StatelessWidget {
  final String from;
  final String to;
  final String time;
  final int adult;
  final int children;
  final int infant;

  const RecentSearchCard(
      {required this.from,
      required this.to,
      required this.time,
      required this.adult,
      required this.children,
      required this.infant,
      super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth > 385 ? maxWidth / 1.3 : maxWidth / 1.2,
      height: 90,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFE1E1E1)),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SubHeadingText(
                      text: from,
                      color: const Color(0xFF333333),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                          'assets/icons/arrow-swap-horizontal.svg'),
                    ),
                    SubHeadingText(
                      text: to,
                      color: const Color(0xFF333333),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: SubHeadingText(
                    text: time,
                    fontsize: 11,
                    color: const Color(0xFF666666),
                  ),
                ),
                BodyText(
                  text: '$adult adults - $children children - $infant infant',
                  fontsize: 12,
                  color: const Color(0xFF666666),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 11),
            child: SvgPicture.asset('assets/icons/see-details.svg'),
          ),
        ],
      ),
    );
  }
}

class RecentSearchSection extends StatelessWidget {
  const RecentSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(
            text: 'Recently Searched',
            fontsize: 16,
            color: Color(0xFF333333),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 90,
            width: maxWidth,
            child: ListView.builder(
                itemCount: RecentSearch.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final card = RecentSearch.values[index];
                  return Padding(
                    padding: EdgeInsets.only(right: index < RecentSearch.values.length - 1 ? 10 : 0),
                    child: RecentSearchCard(
                        from: card.from,
                        to: card.to,
                        time: card.time,
                        adult: card.people['adult']!,
                        children: card.people['children']!,
                        infant: card.people['infant']!),
                  );
                }),
          )
        ],
      ),
    );
  }
}
