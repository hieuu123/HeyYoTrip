import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_event.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class CheapestFlightsSection extends StatelessWidget {
  // final String sectionTitle;
  final List<String> categories;
  final List<List<String>> promotionData;
  final List<List<Map<String, String>>> placeData;

  const CheapestFlightsSection(
      {
      // required this.sectionTitle,
      required this.categories,
      required this.promotionData,
      required this.placeData,
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
          PromotionList(
            promotionData: promotionData,
            placeData: placeData,
          ),
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
                                    ? const Color(0xFF3982D1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SubHeadingText(
                                text: categories[index],
                                color: isSelected
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF3982D1),
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
  final List<List<Map<String, String>>> placeData;
  final double left;
  final double right;

  const PromotionList(
      {required this.promotionData,
      required this.placeData,
      this.left = 16,
      this.right = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as CategoryInitial).selectedIndex;
        List<String> selectedPromotions = promotionData[selectedIndex];

        return SizedBox(
          height: maxWidth / 2.75,
          child: Padding(
            padding: EdgeInsets.only(left: left, right: right),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedPromotions.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  margin: (index < selectedPromotions.length - 1)
                      ? const EdgeInsets.only(right: 10)
                      : null,
                  width: maxWidth / 2.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(selectedPromotions[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SubHeadingText(
                            text: '${placeData[selectedIndex][index]['from']}',
                            color: Colors.white,
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                              'assets/icons/arrow-swap-horizontal.svg',
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn)),
                        ),
                        Flexible(
                          child: SubHeadingText(
                            text: '${placeData[selectedIndex][index]['to']}',
                            color: Colors.white,
                            fontsize: 12,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
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
