import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/profile/blocs/profile_state.dart';

Widget countryField() {
  return BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      return DropdownButtonFormField<String>(
        value: state.country,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
          ),
        ),
        style: const TextStyle(
            color: Color(0xFF333333),
            fontFamily: 'OpenSans',
            fontSize: 14,
            fontWeight: FontWeight.w600),
        items: const [
          DropdownMenuItem(value: 'Vietnam', child: Text('Vietnam')),
          DropdownMenuItem(value: 'USA', child: Text('USA')),
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
  );
}
