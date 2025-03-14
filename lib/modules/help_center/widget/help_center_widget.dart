// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/help_center/extension/help_center_extension.dart';
import 'package:go_router/go_router.dart';
// import 'package:heyyo_trip/modules/account/extension/account_extension.dart';

class HelpCenterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HelpCenterAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/back2.svg')),
      title: const HeadingText(
        text: 'Help Center',
        color: Color(0xFF0D276E),
        fontsize: 20,
      ),
      shape: const Border(
          bottom: BorderSide(
              color: Color.fromARGB(255, 216, 216, 220),
              width: 1,
              style: BorderStyle.solid)),
    );
  }
}

class HelpTextField extends StatelessWidget {
  const HelpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Type any question or keyword',
            hintStyle: const TextStyle(
                fontFamily: 'OpenSans', color: Color.fromARGB(80, 26, 32, 61)),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset('assets/icons/search.svg'),
            )),
      ),
    );
  }
}

class HelpSearchSection extends StatelessWidget {
  const HelpSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 185,
      child: Stack(children: [
        Positioned(
            top: 0,
            left: 42,
            child: SvgPicture.asset('assets/icons/help-center-bg1.svg')),
        Positioned(
            top: 10,
            right: 27,
            child: SvgPicture.asset('assets/icons/help-center-bg3.svg')),
        Positioned(
            top: 4,
            left: 105,
            child: SvgPicture.asset('assets/icons/help-center-bg2.svg')),
        Positioned(
          bottom: 22,
          left: 125,
          child: SvgPicture.asset('assets/icons/help-center-bg5.svg'),
        ),
        Positioned(
          bottom: 15,
          left: 128,
          child: SvgPicture.asset('assets/icons/help-center-bg4.svg'),
        ),
        Positioned(
          bottom: 55,
          right: 50,
          child: SvgPicture.asset('assets/icons/help-center-bg5.svg'),
        ),
        Positioned(
          bottom: 48,
          right: 52,
          child: SvgPicture.asset('assets/icons/help-center-bg4.svg'),
        ),
        const Center(child: HelpTextField())
      ]),
    );
  }
}

class HelpCategory extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String title;
  final HelpCategories category;

  const HelpCategory(
      {required this.icon1,
      required this.icon2,
      required this.title,
      required this.category,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/help-center/details/${category.name}'),
      child: Container(
        alignment: Alignment.center,
        color: const Color(0xFFFAFAFA),
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(icon1),
                SvgPicture.asset(icon2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: BodyText(text: title),
            )
          ],
        ),
      ),
    );
  }
}

class HelpCategorySection extends StatelessWidget {
  const HelpCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.75),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: HelpCategories.values.length,
            itemBuilder: (context, index) {
              var category = HelpCategories.values[index];
              return HelpCategory(
                  icon1: category.icon1,
                  icon2: category.icon2,
                  title: category.title,
                  category: category,);
            }),
      ],
    );
  }
}

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

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      alignment: Alignment.center,
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18, bottom: 10),
            child: SubHeadingText(
              text: 'Do you need additional assistance?',
              fontsize: 18,
              color: Color(0xFF333333),
            ),
          ),
          const BodyText(
              text:
                  "You still haven't found the answer you need. Please send us your questions.",
              isCenter: true),
          const Padding(
            padding: EdgeInsets.only(top: 4, bottom: 30),
            child: BodyText(
                text: "Our friendly support team is here to help.",
                isCenter: true),
          ),
          SecondaryButton(
            text: 'Contact Heyotrip',
            onPressed: () {},
            vertical: 10,
          )
        ],
      ),
    );
  }
}

class MoreHelpSection extends StatelessWidget {
  const MoreHelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/help-contact.svg'),
            const SizedBox(
              width: 10,
            ),
            const BodyText(
              text: 'Need More Help ?',
              color: Color(0xFF242426),
              fontsize: 18,
            )
          ],
        ),
        const SizedBox(
          height: 11,
        ),
        RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
            ),
            children: [
              TextSpan(
                text:
                    "If you need any assistance regarding the booking, please send us a message with Order ID to ",
                style: TextStyle(color: Color(0xFF333333)),
              ),
              TextSpan(
                text: "support@heyotrip.com",
                style: TextStyle(
                  color: Color(0xFF3982D1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ". We will respond to you within 48 hours.",
                style: TextStyle(color: Color(0xFF333333)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
