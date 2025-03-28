import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/special_campaign_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/blocs/hot_deals_bloc.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/hot_deals_widget.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotDealsCategoryBloc(),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SearchField(),
          const CampaignSelector(),
          const Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, child: CampaingnContent())),
        ],
      ),
    );
  }
}
