import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/help_center_details_widget.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/help_center_widget.dart';
import 'package:heyyo_trip/modules/homepage/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/homepage/help_center/extension/help_center_extension.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/toggle_question.dart';
import 'package:heyyo_trip/modules/homepage/help_center/extension/details_category.dart';

class HelpCenterDetailsScreen extends StatefulWidget {
  final HelpCategories category;

  const HelpCenterDetailsScreen({required this.category, super.key});

  @override
  State<HelpCenterDetailsScreen> createState() =>
      HelpCenterDetailsScreenState();
}

class HelpCenterDetailsScreenState extends State<HelpCenterDetailsScreen> {
  late ScrollController _scrollController;
  int selectedIndex = 0;
  final Map<int, GlobalKey> sectionKeys = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // 🔹 Sử dụng totalCategories để tạo key đúng số lượng danh mục
    for (int i = 1; i <= widget.category.totalCategories; i++) {
      sectionKeys[i] = GlobalKey();
    }

    // Lắng nghe sự kiện scroll để thay đổi selectedIndex trên HeaderNav
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    bool isAtBottom = _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;

    List<int> validIndexes = [];
    for (int i = 1; i <= widget.category.questionIndexes.length; i++) {
      if (widget.category.getQuestionIndexes(i).isNotEmpty) {
        validIndexes.add(i);
      }
    }

    for (int i in validIndexes) {
      final key = sectionKeys[i];
      if (key != null) {
        final RenderBox? box =
            key.currentContext?.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy;
          if (position > 190 && position < 250) {
            if (selectedIndex != validIndexes.indexOf(i)) {
              setState(() {
                selectedIndex = validIndexes.indexOf(i);
              });
            }
            break;
          }
        }
      }
    }

    if (isAtBottom && selectedIndex != validIndexes.length - 1) {
      setState(() {
        selectedIndex = validIndexes.length - 1;
      });
    }
  }

  void _scrollToIndex(int index) {
    List<int> validIndexes = [];
    for (int i = 1; i <= sectionKeys.length; i++) {
      if (widget.category.getDetailsCategoryByIndex(i).isNotEmpty) {
        validIndexes.add(i);
      }
    }

    if (index >= validIndexes.length) return;

    final key = sectionKeys[validIndexes[index]];

    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    if (index == validIndexes.length - 1) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HelpCenterAppBar(),
      body: Column(
        children: [
          DetailsHeaderNav(
            category: widget.category,
            selectedIndex: selectedIndex,
            onCategorySelected: _scrollToIndex,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16),
                child: HeadingText(
                  text: widget.category.title,
                  color: const Color(0xFF333333),
                  fontsize: 18,
                ),
              )),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ...List.generate(
                      widget.category.totalCategories,
                      (index) => widget.category
                              .getDetailsCategoryByIndex(index + 1)
                              .isNotEmpty
                          ? DetailsToggleQuestionSection(
                              key: sectionKeys[index + 1],
                              category: widget.category,
                              detailsCategoryIndex: index + 1,
                              startIndex:
                                  widget.category.getStartIndex(index + 1),
                              endIndex: widget.category.getEndIndex(index + 1),
                            )
                          : const SizedBox(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ContactSection(),
                    ),
                    const MoreHelpSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
