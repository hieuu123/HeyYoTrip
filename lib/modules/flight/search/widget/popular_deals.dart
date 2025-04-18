import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';

class FlightSearchPopularDeals extends StatelessWidget {
  const FlightSearchPopularDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 30, right: 15, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeadingText(
                text: 'Popular Deals',
                fontsize: 16,
                color: Color(0xFF333333),
              ),
              Row(
                children: [
                  const SubHeadingText(
                    text: 'See more',
                    fontsize: 16,
                    color: Color(0xFF3982D1),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SvgPicture.asset('assets/icons/blue-arrow-right.svg')
                ],
              ),
            ],
          ),
        ),
        const PromotionList(
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

class PromotionList extends StatefulWidget {
  final List<List<String>> promotionData;

  const PromotionList({
    required this.promotionData,
    super.key,
  });

  @override
  State<PromotionList> createState() => _PromotionListState();
}

class _PromotionListState extends State<PromotionList> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double cardWidth = 280;
  double spacing = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final totalCard = cardWidth + spacing;
    final index = (offset + totalCard / 2) ~/ totalCard;
    if (index != _currentIndex && index < widget.promotionData[0].length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _scrollToIndex(int index) {
    final offset = index * (cardWidth + spacing);
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        final selectedIndex = (state as CategoryInitial).selectedIndex;
        final selectedPromotions = widget.promotionData[selectedIndex];

        return Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: selectedPromotions.length,
                padding: const EdgeInsets.only(left: 16),
                itemBuilder: (context, index) {
                  return Container(
                    width: cardWidth,
                    margin: EdgeInsets.only(
                      right:
                          index == selectedPromotions.length - 1 ? 16 : spacing,
                    ),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(selectedPromotions.length, (index) {
                return GestureDetector(
                  onTap: () => _scrollToIndex(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xFF3982D1)
                          : const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
