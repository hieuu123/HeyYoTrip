import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/help_center_widget.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_state.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/recent_search_section.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/search_section.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';

class HotelSearchScreen extends StatelessWidget {
  const HotelSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HotelSearchAppBar(),
      body: BlocListener<SearchDateBloc, SearchDateState>(
        listener: (context, state) {
          if (state.checkIn != null && state.checkOut != null) {
            debugPrint('Check-in: ${state.checkIn}, Check-out: ${state.checkOut}, Nights: ${state.nights}');
          }
        },
        child: const Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SearchSection(),
                    CustomIconSection(),
                    SizedBox(height: 25),
                    RecentSearchSection(),
                    HotelSearchPopularDeals(),
                    SizedBox(height: 20),
                    HotelSearchPopularPlaces(),
                    HotelSearchTravelTicket(),
                    SizedBox(height: 20),
                    HotelSearchTravelGuide(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: MoreHelpSection(
                        hasBorder: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
