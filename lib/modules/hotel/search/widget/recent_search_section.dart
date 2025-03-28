import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/enum/search_enum.dart';
import 'package:heyyo_trip/modules/hotel/search/extension/search_extension.dart';

class RecentSearchSection extends StatelessWidget {
  const RecentSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(
                  text: 'Recently Searched',
                  fontsize: 16,
                  color: Color(0xFF333333),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: RecentSearchEnum.values.length,
                    itemBuilder: (context, index) {
                      final recentSearch = RecentSearchEnum.values[index];
                      return Container(
                        margin: (index < RecentSearchEnum.values.length - 1)
                            ? const EdgeInsets.only(right: 10)
                            : null,
                        child: RecentSearchCard(
                          title: recentSearch.title,
                          time: recentSearch.time,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RecentSearchCard extends StatelessWidget {
  final String title;
  final String time;

  const RecentSearchCard({
    required this.title,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth / 2.4,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: SizedBox(
              height: 112,
              width: double.infinity,
              child: Image.asset(
                'assets/images/hotel-recent-search.jfif',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  text: title,
                  color: const Color(0xFF333333),
                  fontsize: 14,
                ),
                const SizedBox(height: 4),
                BodyText(
                  text: time,
                  fontsize: 12,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
