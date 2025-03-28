import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/hot_deals_widget.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/widget/appbar.dart';

class HotDealsScreen extends StatefulWidget {
  const HotDealsScreen({super.key});

  @override  
  State<HotDealsScreen> createState() => HotDealsScreenState();
}

class HotDealsScreenState extends State<HotDealsScreen> {

  @override  
  Widget build (BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: HotDealsAppBar(),
      body: HotDealsTabBar(),
    );
  }
}