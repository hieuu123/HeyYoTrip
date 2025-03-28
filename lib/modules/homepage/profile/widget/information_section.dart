import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_state.dart';

class InformationField extends StatelessWidget {
  final String title;
  final String value;
  final bool isEmail;
  final bool isPhoneNumber;
  final bool isAddress;
  final String? countryCode;

  const InformationField(
      {required this.title,
      required this.value,
      this.isEmail = false,
      this.isPhoneNumber = false,
      this.isAddress = false,
      this.countryCode,
      super.key});

  @override
  Widget build(BuildContext context) {
    // final maxWidth = MediaQuery.of(context).size.width;
    String flagPath = 'assets/images/vietnam-flag.png';
    if (countryCode == 'US') flagPath = 'assets/images/usa-flag.png';
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: !isAddress
                    ? const BorderSide(width: 0.5, color: Color(0xFFD7D7D7))
                    : BorderSide.none)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyText(text: title),
            isPhoneNumber
                ? Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        Image.asset(flagPath,
                            width: 32),
                        const SizedBox(
                          width: 10,
                        ),
                        SubHeadingText(
                          text: value,
                          color: const Color(0xFF333333),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingText(
                          text: value,
                          color: const Color(0xFF333333),
                        ),
                        isEmail
                            ? const SubHeadingText(
                                text: 'Verify',
                                color: Color(0xFF3982D1),
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class InformationSection extends StatelessWidget {
  final ProfileState profileState;

  const InformationSection({super.key, required this.profileState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationField(title: 'Name', value: profileState.name),
        InformationField(
            title: 'Email address', value: profileState.email, isEmail: true),
        InformationField(
            title: 'Phone number',
            value: profileState.phone,
            countryCode: profileState.countryCode,
            isPhoneNumber: true),
        InformationField(title: 'Date of birth', value: profileState.birth),
        InformationField(title: 'Gender', value: profileState.gender),
        InformationField(title: 'Country', value: profileState.country),
        InformationField(
            title: 'Address', value: profileState.address, isAddress: true),
      ],
    );
  }
}
