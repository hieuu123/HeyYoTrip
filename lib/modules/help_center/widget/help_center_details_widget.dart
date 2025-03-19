import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/help_center/extension/details_category.dart';

class DetailsHeaderNav extends StatefulWidget {
  final HelpCategories category;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const DetailsHeaderNav({
    required this.category,
    required this.selectedIndex,
    required this.onCategorySelected,
    super.key,
  });

  @override
  State<DetailsHeaderNav> createState() => DetailsHeaderNavState();
}

class DetailsHeaderNavState extends State<DetailsHeaderNav> {
  late ScrollController _scrollController;
  late List<String> validCategories;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _updateValidCategories();
  }

  @override
  void didUpdateWidget(covariant DetailsHeaderNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _scrollToSelected();
    }
  }

  void _updateValidCategories() {
    validCategories = List.generate(widget.category.totalCategories,
            (index) => widget.category.getDetailsCategoryByIndex(index + 1))
        .where((category) => category.isNotEmpty)
        .toList();
  }

  void _scrollToSelected() {
    double offset = widget.selectedIndex * 110; // Căn chỉnh khoảng cách
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 227, 227, 227), width: 1)),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(validCategories.length, (index) {
            bool isSelected = widget.selectedIndex == index;
            return GestureDetector(
              onTap: () {
                widget.onCategorySelected(index);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  border: index < validCategories.length - 1
                      ? const Border(
                          right: BorderSide(color: Color(0xFFEDEDED), width: 1))
                      : null,
                ),
                child: SubHeadingText(
                  text: validCategories[index],
                  color: isSelected
                      ? const Color(0xFF3982D1)
                      : const Color(0xFF747474),
                  fontsize: 14,
                  isChosen: isSelected ? true : false,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
