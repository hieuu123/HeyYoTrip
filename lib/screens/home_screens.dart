import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/appbar.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: Center(
        child: Column(
          children: [
            HeaderNav(),
          ],
        ),
      ),
    );
  }
}
