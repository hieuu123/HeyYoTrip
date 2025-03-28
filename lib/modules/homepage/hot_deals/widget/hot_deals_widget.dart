import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/view/promotion_code_tab.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/view/special_campaign_tab.dart';

class HotDealsTabBar extends StatelessWidget {
  const HotDealsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Tab(text: 'Special campaign'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Tab(text: 'Promotion code'),
                ),
              ),
            ],
            labelColor:Color(0xFF3982D1),
            unselectedLabelColor:Color(0xFF666666),
            indicatorColor:Color(0xFF3982D1),
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w400),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Tab1(),
                Tab2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField({super.key});
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFD7D7D7),
          )),
          hintText: 'Search promotion',
          hintStyle: const TextStyle(
              color: Color.fromARGB(77, 26, 32, 61),
              fontSize: 16,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ),
    );
  }
}
