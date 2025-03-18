import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/value/app_value.dart';
import 'package:heyyo_trip/modules/hot_deals/widget/special_campaign_widget.dart';
import 'package:heyyo_trip/modules/hot_deals/widget/appbar.dart';

class SpecialCampaignDetails extends StatelessWidget {
  final String? title;
  final String? image;

  const SpecialCampaignDetails({
    super.key,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CampaignDetailsAppBar(title: title ?? 'Campaign Details'),
      body: Column(
        children: [
          if (image != null)
            SizedBox(
                height: 155,
                width: double.infinity,
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                )),
          Expanded(
              child: SingleChildScrollView(
                  child: PlaceListView(placeData: placeData)))
        ],
      ),
    );
  }
}
