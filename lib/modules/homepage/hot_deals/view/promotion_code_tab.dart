import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/promotion_code_widget.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/special_campaign_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/blocs/hot_deals_bloc.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/hot_deals_widget.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotDealsCategoryBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchField(
              hintText: 'Search promotion',
            ),
            const CampaignSelector(),
            const Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, child: PromotionContent())),
          ],
        ),
      ),
    );
  }
}
