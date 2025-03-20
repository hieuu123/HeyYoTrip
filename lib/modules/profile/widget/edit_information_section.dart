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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          EditInformationField(
            title: 'Name',
            value: nameController.text,
            controller: nameController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditInformationField(
              title: 'Email address',
              value: emailController.text,
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditInformationField(
              title: 'Phone number',
              value: phoneController.text,
              controller: phoneController,
              countryCode: countryCode,
              isPhone: true,
              onCountryChanged: onCountryChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditInformationField(
              title: 'Date of birth',
              value: birthController.text,
              controller: birthController,
              isBirthday: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditInformationField(
              title: 'Gender',
              value: genderController.text,
              controller: genderController,
              isGender: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: EditInformationField(
              title: 'Country',
              value: countryController.text,
              controller: countryController,
              isCountry: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: EditInformationField(
              title: 'Address',
              value: addressController.text,
              controller: addressController,
            ),
          ),
        ],
      ),
    );
  }
}
