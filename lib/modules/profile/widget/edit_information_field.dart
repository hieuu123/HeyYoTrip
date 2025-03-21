import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_state.dart';

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
      field = _buildPhoneField(context);
    } else if (isBirthday) {
      field = _buildBirthdayField(context);
    } else if (isGender) {
      field = _buildGenderField(context);
    } else if (isCountry) {
      field = _buildCountryField(context);
    } else {
      field = _buildDefaultField();
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

  Widget _buildDefaultField() {
    return TextFormField(
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

  Widget _buildPhoneField(BuildContext context) {
    return _PhoneNumberField(
      controller: controller,
      countryCode: countryCode,
      onCountryChanged: onCountryChanged ?? (value) {},
    );
  }

  Widget _buildBirthdayField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.datetime,
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

  Widget _buildGenderField(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.gender,
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
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<ProfileBloc>().add(
                    UpdateProfile(
                      gender: newValue,
                      name: state.name,
                      email: state.email,
                      phone: state.phone,
                      birth: state.birth,
                      countryCode: state.countryCode,
                      country: state.country,
                      address: state.address,
                    ),
                  );
            }
          },
        );
      },
    );
  }

  Widget _buildCountryField(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.country,
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
          items: const [
            DropdownMenuItem(value: 'Vietnam', child: Text('Vietnam')),
            DropdownMenuItem(value: 'USA', child: Text('USA')),
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              context.read<ProfileBloc>().add(
                    UpdateProfile(
                      country: newValue,
                      name: state.name,
                      email: state.email,
                      phone: state.phone,
                      birth: state.birth,
                      gender: state.gender,
                      countryCode: state.countryCode,
                      address: state.address,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}

class _PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String countryCode;
  final Function(String) onCountryChanged;

  const _PhoneNumberField({
    required this.controller,
    required this.countryCode,
    required this.onCountryChanged,
  });

  @override
  State<_PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<_PhoneNumberField> {
  late String selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.countryCode;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> countryFlags = {
      "VN": "assets/images/vietnam-flag.png",
      "US": "assets/images/usa-flag.png",
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCountry,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              items: countryFlags.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Image.asset(
                    entry.value,
                    width: 32,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedCountry = newValue;
                  });

                  final state = context.read<ProfileBloc>().state;
                  context.read<ProfileBloc>().add(
                        UpdateProfile(
                          countryCode: newValue,
                          name: state.name,
                          email: state.email,
                          phone: state.phone,
                          birth: state.birth,
                          gender: state.gender,
                          country: state.country,
                          address: state.address,
                        ),
                      );

                  widget.onCountryChanged(newValue);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
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
    );
  }
}
