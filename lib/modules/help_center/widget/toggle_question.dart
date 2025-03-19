import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/help_center/extension/help_center_extension.dart';
import 'package:heyyo_trip/modules/help_center/extension/details_category.dart';
import 'package:heyyo_trip/modules/help_center/extension/question.dart';
import 'package:heyyo_trip/modules/help_center/extension/answer.dart';

class HelpToggleQuestion extends StatefulWidget {
  final String question;
  final String answer;

  const HelpToggleQuestion(
      {required this.question, required this.answer, super.key});

  @override
  State<HelpToggleQuestion> createState() => HelpToggleQuestionState();
}

class HelpToggleQuestionState extends State<HelpToggleQuestion> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SubHeadingText(
                  text: widget.question,
                  color: const Color(0xFF333333),
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
        ),
        Visibility(
            visible: isShow,
            child: Container(
              alignment: Alignment.centerLeft,
              child: BodyText(
                text: widget.answer,
                color: const Color(0xFF8F9098),
              ),
            ))
      ],
    );
  }
}

class HelpToggleQuestionSection extends StatelessWidget {
  const HelpToggleQuestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: FeaturedTopics.values.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return HelpToggleQuestion(
                  question: FeaturedTopics.values[index].question,
                  answer: FeaturedTopics.values[index].answer);
            })
      ],
    );
  }
}

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
