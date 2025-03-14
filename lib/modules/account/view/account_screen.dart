import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/account/widget/account_widget.dart';
import 'package:heyyo_trip/modules/account/enum/account_enum.dart';
import 'package:heyyo_trip/modules/account/extension/account_extension.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AccountAppBar(),
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
            const SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}
