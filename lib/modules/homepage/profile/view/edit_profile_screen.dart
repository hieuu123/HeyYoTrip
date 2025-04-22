import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/fullscreen_loader.dart';
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

  bool _didSubmit = false;

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
    _countryCode =
        profileState.countryCode.isNotEmpty ? profileState.countryCode : 'VN';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) =>
          previous.message != current.message ||
          previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if (state.message != null && _didSubmit) {
          final scaffoldContext = context;
          FullScreenLoader.hide();
          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
            SnackBar(
              content: Text(state.message!),
              backgroundColor: state.isSuccess! ? Colors.green : Colors.red,
              duration: const Duration(milliseconds: 1750),
            ),
          );

          if (state.isSuccess == true) {
            Future.delayed(const Duration(milliseconds: 100), () {
              if (scaffoldContext.mounted) GoRouter.of(scaffoldContext).pop();
            });
          }

          _didSubmit = false;
          context.read<ProfileBloc>().add(ClearProfileMessage());
        }
      },
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        return GestureDetector(
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
                          _didSubmit = true;
                          FocusScope.of(context).unfocus(); // Đóng bàn phím
                          FullScreenLoader.show(context);

                          // Set timeout 5s đề phòng không có phản hồi (mạng chậm/mất)
                          Future.delayed(const Duration(seconds: 5), () {
                            if (mounted) {
                              FullScreenLoader.hide();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Không thể kết nối. Vui lòng kiểm tra internet.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              _didSubmit = false;
                            }
                          });

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
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
