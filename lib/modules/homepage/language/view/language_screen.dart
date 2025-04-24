import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/search_field.dart';
import 'package:heyyo_trip/modules/homepage/language/widget/selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatelessWidget {
  final bool popOnSelect;
  const LanguageScreen({Key? key, this.popOnSelect = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const LanguageAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 20),
              child: LanguageSearchField(
                hintText: AppLocalizations.of(context)!.selectDate,
              ),
            ),
            Expanded(
              child: LanguageSelector(popOnSelect: popOnSelect),
            ),
          ],
        ),
      ),
    );
  }
}
