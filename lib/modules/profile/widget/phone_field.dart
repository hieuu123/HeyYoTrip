import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_event.dart';

Widget phoneNumberField({
  required TextEditingController controller,
  required String countryCode,
  required Function(String) onCountryChanged,
}) {
  return _PhoneNumberField(
    controller: controller,
    countryCode: countryCode,
    onCountryChanged: onCountryChanged,
  );
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

                  // Cập nhật Bloc khi thay đổi quốc gia
                  context.read<ProfileBloc>().add(
                        UpdateProfile(
                          countryCode: newValue,
                          name: context.read<ProfileBloc>().state.name,
                          email: context.read<ProfileBloc>().state.email,
                          phone: context.read<ProfileBloc>().state.phone,
                          birth: context.read<ProfileBloc>().state.birth,
                          gender: context.read<ProfileBloc>().state.gender,
                          country: context.read<ProfileBloc>().state.country,
                          address: context.read<ProfileBloc>().state.address,
                        ),
                      );

                  // Callback để cập nhật UI bên ngoài
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
