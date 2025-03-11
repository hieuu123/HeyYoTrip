import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
// import 'package:heyyo_trip/common/widget/textfield.dart';
import 'package:heyyo_trip/modules/help_center/widget/help_center_widget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: HelpCenterAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 4),
                    child: Center(
                      child: HeadingText(
                        text: 'Heyotrip Help Center',
                        color: Color(0xFF333333),
                        fontsize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Center(
                      child: BodyText(
                        text: 'Hello, how can we help you?',
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  HelpSearchSection(),
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 16, bottom: 10),
                    child: HeadingText(
                      text: 'Categories',
                      fontsize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: HelpCategorySection(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 16, bottom: 20),
                    child: HeadingText(
                      text: 'Most Featured Topics',
                      fontsize: 18,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 10),
                    child: HelpToggleQuestionSection(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                    child: ContactSection(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: MoreHelpSection(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
