import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/information_section.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_state.dart';
import 'package:heyyo_trip/modules/homepage/profile/widget/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfileFromFirestore());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const ProfileAppBar(title: 'Profile'),
          body: Column(
            children: [
              const AvatarFrame(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: InformationSection(profileState: state),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
