import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/profile/widget/birth_field.dart';
import 'package:heyyo_trip/modules/profile/widget/country_field.dart';
import 'package:heyyo_trip/modules/profile/widget/gender_field.dart';
import 'package:heyyo_trip/modules/profile/widget/phone_field.dart';

class EditInformationField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isPhone;
  final String countryCode;
  final Function(String)? onCountryChanged;
  final bool isBirthday;
  final bool isGender;
  final bool isCountry;

  const EditInformationField({
    required this.title,
    required this.controller,
    this.isPhone = false,
    this.countryCode = 'VN',
    this.onCountryChanged,
    this.isBirthday = false,
    this.isGender = false,
    this.isCountry = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget field;

    if (isPhone) {
      field = phoneNumberField(
        controller: controller,
        countryCode: countryCode,
        onCountryChanged: onCountryChanged ?? (value) {},
      );
    } else if (isBirthday) {
      field = birthField(controller: controller);
    } else if (isGender) {
      field = genderField();
    } else if (isCountry) {
      field = countryField();
    } else {
      // Default input field for normal text
      field = TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFD7D7D7),
            ),
          ),
        ),
        style: const TextStyle(
          color: Color(0xFF333333),
          fontFamily: 'OpenSans',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText(text: title, color: const Color(0xFF333333)),
        const SizedBox(height: 10),
        field,
      ],
    );
  }
}
