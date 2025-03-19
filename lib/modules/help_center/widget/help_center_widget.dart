import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';

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
