import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/profile/widget/edit_information_field.dart';

class EditInformationSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController birthController;
  final TextEditingController genderController;
  final TextEditingController countryController;
  final TextEditingController addressController;
  final String countryCode;
  final Function(String) onCountryChanged;

  const EditInformationSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.birthController,
    required this.genderController,
    required this.countryController,
    required this.addressController,
    required this.countryCode,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditInformationField(
          title: 'Name',
          value: nameController.text,
          controller: nameController,
        ),
        EditInformationField(
          title: 'Email address',
          value: emailController.text,
          controller: emailController,
        ),
        EditInformationField(
          title: 'Phone number',
          value: phoneController.text,
          controller: phoneController,
          countryCode: countryCode,
          isPhone: true,
          onCountryChanged: onCountryChanged,
        ),
        EditInformationField(
          title: 'Date of birth',
          value: birthController.text,
          controller: birthController,
          isBirthday: true,
        ),
        EditInformationField(
          title: 'Gender',
          value: genderController.text,
          controller: genderController,
          isGender: true,
        ),
        EditInformationField(
          title: 'Country',
          value: countryController.text,
          controller: countryController,
          isCountry: true,
        ),
        EditInformationField(
          title: 'Address',
          value: addressController.text,
          controller: addressController,
        ),
      ],
    );
  }
}
