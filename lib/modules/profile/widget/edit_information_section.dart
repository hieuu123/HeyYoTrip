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
    final FocusNode nameFocus = FocusNode();
    final FocusNode emailFocus = FocusNode();
    final FocusNode phoneFocus = FocusNode();
    // final FocusNode birthFocus = FocusNode();
    final FocusNode genderFocus = FocusNode();
    final FocusNode countryFocus = FocusNode();
    final FocusNode addressFocus = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          EditInformationField(
            title: 'Name',
            controller: nameController,
            focusNode: nameFocus,
            nextFocus: emailFocus,
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Email address',
            controller: emailController,
            focusNode: emailFocus,
            nextFocus: phoneFocus,
            isEmail: true
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Phone number',
            controller: phoneController,
            countryCode: countryCode,
            isPhone: true,
            onCountryChanged: onCountryChanged,
            focusNode: phoneFocus,
            nextFocus: genderFocus,
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Date of birth',
            controller: birthController,
            isBirthday: true,
            // focusNode: birthFocus,
            // nextFocus: genderFocus,
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Gender',
            controller: genderController,
            isGender: true,
            focusNode: genderFocus,
            nextFocus: countryFocus,
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Country',
            controller: countryController,
            isCountry: true,
            focusNode: countryFocus,
            nextFocus: addressFocus,
          ),
          const SizedBox(height: 20),
          EditInformationField(
            title: 'Address',
            controller: addressController,
            focusNode: addressFocus,
            // nextFocus: phoneFocus,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
