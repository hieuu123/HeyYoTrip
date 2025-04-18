import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/flight/search/widget/select_place_widget.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/hot_deals_widget.dart';

class SelectPlace extends StatelessWidget {
  const SelectPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionType = GoRouterState.of(context).extra as String?;

    // Đảm bảo selectionType là một trong hai giá trị 'from' hoặc 'to'
    final validSelectionType =
        (selectionType == 'from' || selectionType == 'to')
            ? selectionType!
            : 'from';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const SelectDateAppBar(
            title: 'Search Flight', icon: 'assets/icons/back3.svg'),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SearchField(
                      hintText: 'Enter city, hotel, place to go...',
                    ),
                  ),
                  const SelectPlaceRecentSearch(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFFEDEDED),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectPlacePoluparCities(
                    selectionType: validSelectionType,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
