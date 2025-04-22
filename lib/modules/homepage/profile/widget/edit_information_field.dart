import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:heyyo_trip/common/widget/text.dart';

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
  final bool isReadOnly;

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
    this.isReadOnly = false,
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
            Container(
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
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      textInputAction: textInputAction,
                      readOnly: isReadOnly,
                      onChanged: (val) {
                        formState.didChange(val);
                      },
                      onFieldSubmitted: (_) {
                        if (nextFocus != null) {
                          FocusScope.of(context).requestFocus(nextFocus);
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontFamily: 'OpenSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (isReadOnly)
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SvgPicture.asset('assets/icons/lock.svg'),
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
                      value: ['VN', 'US'].contains(countryCode)
                          ? countryCode
                          : null,
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
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (controller.text.trim().isEmpty) {
          return 'Please select your birthday';
        }
        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
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
                  formState
                      .didChange(controller.text); // cập nhật state validator
                }
              },
              child: AbsorbPointer(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: formState.hasError
                          ? Colors.red
                          : const Color(0xFFD7D7D7),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
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
                          readOnly: true,
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
                            controller.text =
                                DateFormat('dd/MM/yyyy').format(selectedDate);
                            formState.didChange(controller.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (formState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  formState.errorText!,
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

  Widget _buildDropdownField({
    required BuildContext context,
    required List<String> options,
    required String fieldType,
  }) {
    // final trimmedText = controller.text.trim();
    // final String? currentValue =
    //     options.contains(trimmedText) ? trimmedText : null;

    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (isRequired && controller.text.trim().isEmpty) {
          return 'Please select your $fieldType';
        }
        return null;
      },
      builder: (formState) {
        final String? currentValue = options.contains(controller.text.trim())
            ? controller.text.trim()
            : null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      formState.hasError ? Colors.red : const Color(0xFFD7D7D7),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: currentValue,
                  isExpanded: true,
                  hint: const SubHeadingText(text: 'Select', color: Color(0xFF333333),),
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  items: options.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.text = newValue;
                      formState.didChange(newValue); // cập nhật formState
                    }
                  },
                ),
              ),
            ),
            if (formState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  formState.errorText!,
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
}
