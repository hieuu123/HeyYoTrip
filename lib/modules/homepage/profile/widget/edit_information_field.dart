import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';

class EditInformationField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isPhone;
  final String countryCode;
  final Function(String)? onCountryChanged;
  final bool isBirthday;
  final bool isGender;
  final bool isCountry;
  final bool isEmail;
  final bool isRequired;

  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputAction textInputAction;

  const EditInformationField({
    required this.title,
    required this.controller,
    this.isPhone = false,
    this.countryCode = 'VN',
    this.onCountryChanged,
    this.isBirthday = false,
    this.isGender = false,
    this.isCountry = false,
    this.focusNode,
    this.nextFocus,
    this.textInputAction = TextInputAction.next,
    this.isEmail = false,
    this.isRequired = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget field;

    if (isPhone) {
      field = _buildPhoneField(context);
    } else if (isBirthday) {
      field = _buildBirthdayField(context);
    } else if (isGender) {
      field = _buildDropdownField(
        context: context,
        options: ['Male', 'Female'],
        fieldType: 'gender',
      );
    } else if (isCountry) {
      field = _buildDropdownField(
        context: context,
        options: ['Vietnam', 'USA'],
        fieldType: 'country',
      );
    } else {
      field = _buildDefaultField(context);
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

  Widget _buildDefaultField(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final text = controller.text.trim();

        if (isRequired && text.isEmpty) {
          return 'This field is required';
        }

        if (isEmail) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!emailRegex.hasMatch(text)) {
            return 'Invalid email format';
          }
        }

        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: textInputAction,
              onChanged: (val) {
                formState.didChange(val); // cập nhật lại trạng thái
              },
              onFieldSubmitted: (_) {
                if (nextFocus != null) {
                  FocusScope.of(context).requestFocus(nextFocus);
                } else {
                  FocusScope.of(context).unfocus();
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    width: 1,
                    color: formState.hasError
                        ? Colors.red
                        : const Color(0xFFD7D7D7),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    width: 1,
                    color: formState.hasError
                        ? Colors.red
                        : const Color(0xFFD7D7D7),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF333333),
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (formState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  formState.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    final Map<String, String> countryFlags = {
      "VN": "assets/images/vietnam-flag.png",
      "US": "assets/images/usa-flag.png",
    };

    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final text = controller.text.trim();

        if (text.isEmpty) {
          return 'This field is required';
        }

        final phoneRegex = RegExp(r'^[0-9]{8,15}$');
        if (!phoneRegex.hasMatch(text)) {
          return 'Invalid phone number';
        }

        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      formState.hasError ? Colors.red : const Color(0xFFD7D7D7),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: countryCode,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey),
                      items: countryFlags.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Image.asset(entry.value, width: 32),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          onCountryChanged?.call(newValue);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      textInputAction: textInputAction,
                      onChanged: (val) => formState.didChange(val),
                      onFieldSubmitted: (_) {
                        if (nextFocus != null) {
                          FocusScope.of(context).requestFocus(nextFocus);
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: 'OpenSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (formState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  formState.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildBirthdayField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  controller.text =
                      DateFormat('dd/MM/yyyy').format(selectedDate);
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: textInputAction,
                  decoration: const InputDecoration(
                    hintText: 'Enter your birthday',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/calendar.svg'),
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required List<String> options,
    required String fieldType,
  }) {
    final state = context.read<ProfileBloc>().state;
    final currentValue =
        options.contains(controller.text) ? controller.text : options.first;

    return DropdownButtonFormField<String>(
      value: currentValue,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFD7D7D7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
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
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          controller.text = newValue;

          context.read<ProfileBloc>().add(
                UpdateProfile(
                  name: fieldType == 'name' ? newValue : state.name,
                  email: fieldType == 'email' ? newValue : state.email,
                  phone: fieldType == 'phone' ? newValue : state.phone,
                  birth: fieldType == 'birth' ? newValue : state.birth,
                  gender: fieldType == 'gender' ? newValue : state.gender,
                  country: fieldType == 'country' ? newValue : state.country,
                  address: fieldType == 'address' ? newValue : state.address,
                  countryCode: state.countryCode,
                ),
              );
        }
      },
    );
  }
}
