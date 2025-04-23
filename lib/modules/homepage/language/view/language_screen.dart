import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/search_field.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/selector.dart';

class LanguageScreen extends StatelessWidget {
  final bool popOnSelect;
  const LanguageScreen({super.key, this.popOnSelect = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const LanguageAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 20),
              child: LanguageSearchField(hintText: 'Search for language',),
            ),
            LanguageSelector()
          ],
        ),
      ),
    );
  }
}
