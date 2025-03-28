import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/edit_information_section.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/profile_widget.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_state.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _birthController;
  late TextEditingController _genderController;
  late TextEditingController _countryController;
  late TextEditingController _addressController;
  late String _countryCode;
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final profileState = context.read<ProfileBloc>().state;
    _nameController = TextEditingController(text: profileState.name);
    _emailController = TextEditingController(text: profileState.email);
    _phoneController = TextEditingController(text: profileState.phone);
    _birthController = TextEditingController(text: profileState.birth);
    _genderController = TextEditingController(text: profileState.gender);
    _countryController = TextEditingController(text: profileState.country);
    _addressController = TextEditingController(text: profileState.address);
    _countryCode = profileState.countryCode;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) =>
          previous != current,
      listener: (context, state) {
        setState(() {
          _genderController.text = state.gender;
          _countryController.text = state.country;
        });
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _focusScopeNode.unfocus();
        },
        child: FocusScope(
          node: _focusScopeNode,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const EditProfileAppBar(title: 'Edit profile'),
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  const AvatarFrame(),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: EditInformationSection(
                        nameController: _nameController,
                        emailController: _emailController,
                        phoneController: _phoneController,
                        birthController: _birthController,
                        genderController: _genderController,
                        countryController: _countryController,
                        addressController: _addressController,
                        countryCode: _countryCode,
                        onCountryChanged: (newCountry) {
                          setState(() {
                            _countryCode = newCountry;
                          });
                        },
                      ),
                    ),
                  ),
                  RowButtons(
                    onSave: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<ProfileBloc>().add(UpdateProfile(
                              name: _nameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              birth: _birthController.text,
                              gender: _genderController.text,
                              country: _countryController.text,
                              address: _addressController.text,
                              countryCode: _countryCode,
                            ));
                        GoRouter.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
