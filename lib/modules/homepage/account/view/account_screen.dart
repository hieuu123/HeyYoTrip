import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/account/widget/account_widget.dart';
import 'package:heyyo_trip/modules/homepage/account/enum/account_enum.dart';
import 'package:heyyo_trip/modules/homepage/account/extension/account_extension.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_state.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AccountAppBar(name: state.name),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: AccountOption.values.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final option = AccountOption.values[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: AccountOptions(
                              icon: option.icon,
                              title: option.title,
                              color: option.color,
                              onTap: option.onTap(context),
                            ),
                          ),
                          if (option.needsDivider)
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(0xFFD8D8DC),
                              ),
                            )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
