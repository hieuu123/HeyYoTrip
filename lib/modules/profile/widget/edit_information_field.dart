import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_state.dart';
import 'package:intl/intl.dart';

class EditInformationField extends StatefulWidget {
  final String title;
  final String value;
  final TextEditingController controller;
  final bool isPhone;
  final String countryCode;
  final Function(String)? onCountryChanged;
  final bool isBirthday;
  final bool isGender;
  final bool isCountry;

  const EditInformationField({
    required this.title,
    required this.value,
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
  State<EditInformationField> createState() => _EditInformationFieldState();
}

class _EditInformationFieldState extends State<EditInformationField> {
  String selectedCountry = "VN";

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText(
          text: widget.title,
          color: const Color(0xFF333333),
        ),
        const SizedBox(height: 10),
        widget.isPhone
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    // Dropdown chọn quốc gia
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCountry,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey),
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
                            context.read<ProfileBloc>().add(
                                  UpdateProfile(
                                    countryCode: newValue,
                                    name: context.read<ProfileBloc>().state.name,
                                    email: context.read<ProfileBloc>().state.email,
                                    phone: context.read<ProfileBloc>().state.phone,
                                    // phone: widget.controller.text,
                                    birth: context.read<ProfileBloc>().state.birth,
                                    gender: context.read<ProfileBloc>().state.gender,
                                    country: context.read<ProfileBloc>().state.country,
                                    address: context.read<ProfileBloc>().state.address,
                                  ),
                                );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),

                    // TextField nhập số điện thoại
                    Expanded(
                      child: TextFormField(
                        controller: widget.controller,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền TextField
                        ),
                        style: const TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : widget.isBirthday
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFD7D7D7), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: widget.controller,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              hintText: 'Enter your birthday',
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                                color: Color(0xFF333333),
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset('assets/icons/calendar.svg'),
                          onPressed: () {
                            // Mở DatePicker để chọn ngày sinh
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                setState(() {
                                  // Định dạng ngày thành dd/MM/yyyy
                                  widget.controller.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(selectedDate);
                                });
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : widget.isGender
                    ? BlocBuilder<ProfileBloc, ProfileState>(
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
                                fontWeight: FontWeight.w600),
                            items: const [
                              DropdownMenuItem(
                                  value: 'Male', child: Text('Male')),
                              DropdownMenuItem(
                                  value: 'Female', child: Text('Female')),
                            ],
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                context.read<ProfileBloc>().add(
                                      UpdateProfile(
                                    gender: newValue,
                                    name: context.read<ProfileBloc>().state.name,
                                    email: context.read<ProfileBloc>().state.email,
                                    phone: context.read<ProfileBloc>().state.phone,
                                    birth: context.read<ProfileBloc>().state.birth,
                                    countryCode: context.read<ProfileBloc>().state.countryCode,
                                    country: context.read<ProfileBloc>().state.country,
                                    address: context.read<ProfileBloc>().state.address,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      )
                    : widget.isCountry
                        ? BlocBuilder<ProfileBloc, ProfileState>(
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
                                    fontWeight: FontWeight.w600),
                                items: const [
                                  DropdownMenuItem(
                                      value: 'Vietnam', child: Text('Vietnam')),
                                  DropdownMenuItem(
                                      value: 'USA', child: Text('USA')),
                                ],
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    context.read<ProfileBloc>().add(
                                          UpdateProfile(
                                            country: newValue,
                                            name: context.read<ProfileBloc>().state.name,
                                            email: context.read<ProfileBloc>().state.email,
                                            phone: context.read<ProfileBloc>().state.phone,
                                            birth: context.read<ProfileBloc>().state.birth,
                                            gender: context.read<ProfileBloc>().state.gender,
                                            countryCode: context.read<ProfileBloc>().state.countryCode,
                                            address: context.read<ProfileBloc>().state.address,
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                          )
                        : TextFormField(
                            controller: widget.controller,
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
                                fontWeight: FontWeight.w600),
                          ),
      ],
    );
  }
}
