import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/help_center/extension/help_center_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsToggleQuestion extends StatefulWidget {
  final int questionIndex;
  final int answerIndex;
  final HelpCategories category;

  const DetailsToggleQuestion(
      {required this.questionIndex,
      required this.answerIndex,
      required this.category,
      super.key});

  @override
  State<DetailsToggleQuestion> createState() => DetailsToggleQuestionState();
}

class DetailsToggleQuestionState extends State<DetailsToggleQuestion> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SubHeadingText(
                text: widget.category.getQuestionByIndex(widget.questionIndex),
                color: const Color(0xFF333333),
                fontsize: 16,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                icon: isShow
                    ? SvgPicture.asset('assets/icons/help-minus1.svg')
                    : SvgPicture.asset('assets/icons/help-plus1.svg'))
          ],
        ),
        const SizedBox(
          height: 0,
        ),
        Visibility(
            visible: isShow,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: BodyText(
                  text: widget.category.getAnswerByIndex(widget.answerIndex),
                  color: const Color(0xFF8F9098),
                  fontsize: 16,
                ),
              ),
            )),
        const SizedBox(
          height: 0,
        ),
      ],
    );
  }
}

class DetailsToggleQuestionSection extends StatelessWidget {
  final HelpCategories category;
  final int detailsCategoryIndex;
  final int startIndex;
  final int endIndex;

  const DetailsToggleQuestionSection(
      {required this.category,
      required this.detailsCategoryIndex,
      required this.startIndex,
      required this.endIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (category.getDetailsCategoryByIndex(detailsCategoryIndex).isNotEmpty)
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SubHeadingText(
                  text:
                      category.getDetailsCategoryByIndex(detailsCategoryIndex),
                  color: const Color(0xFF666666),
                  fontsize: 18,
                ),
              )),
        if (category.getDetailsCategoryByIndex(detailsCategoryIndex).isNotEmpty)
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xFFD7D7D7)),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 7, top: 7, bottom: 10),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (endIndex - startIndex + 1),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: DetailsToggleQuestion(
                          questionIndex: startIndex + index,
                          answerIndex: 1,
                          category: category),
                    );
                  }),
            ),
          ),
        if (category.getDetailsCategoryByIndex(detailsCategoryIndex).isNotEmpty)
          const SizedBox(
            height: 20,
          )
      ],
    );
  }
}

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
