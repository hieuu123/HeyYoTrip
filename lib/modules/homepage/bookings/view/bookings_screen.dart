import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/bookings/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/bookings/widget/bookings_counter.dart';
import 'package:heyyo_trip/modules/homepage/bookings/widget/bookings_selector.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BookingsAppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 75),
              child: BodyText(
                text: 'Hi Hieu, your upcoming trips live here',
                fontsize: 16,
                color: Color(0xFF242426),
              ),
            ),
            BookingsSelector(),
            SizedBox(
              height: 80,
            ),
            Expanded(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: BookingsCounter(),
            ))
          ],
        ),
      ),
    );
  }
}
