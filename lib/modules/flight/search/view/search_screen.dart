import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/value/app_value.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/flight/search/widget/airline_partners.dart';
import 'package:heyyo_trip/modules/flight/search/widget/cheapest_flights.dart';
import 'package:heyyo_trip/modules/flight/search/widget/popular_destinations.dart';
import 'package:heyyo_trip/modules/homepage/help_center/widget/help_center_widget.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';
import 'package:heyyo_trip/modules/flight/search/widget/search_section.dart';
import 'package:heyyo_trip/modules/flight/search/widget/recent_search.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/search_widget.dart';
import 'package:heyyo_trip/modules/flight/search/widget/popular_deals.dart';

class FlightSearchScreen extends StatelessWidget {
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HotelSearchAppBar(title: 'Flights'),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchSection(),
                const CustomIconSection(),
                const FlightSearchPopularDeals(),
                const RecentSearchSection(),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: HeadingText(
                    text: 'Book your Flights for the cheapest',
                    fontsize: 16,
                    color: Color(0xFF333333),
                  ),
                ),
                CheapestFlightsSection(
                    categories: flightCategories,
                    promotionData: flightData,
                    placeData: flightPlaceData),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: HeadingText(
                    text: 'Popular Flight Destinations',
                    fontsize: 16,
                    color: Color(0xFF333333),
                  ),
                ),
                PopularDestinations(
                    promotionData: flightPopularDestinationsImage,
                    title: flightPopularDestinationsTitle),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 16),
                  child: HeadingText(
                    text: 'Airline Partners',
                    fontsize: 16,
                    color: Color(0xFF333333),
                  ),
                ),
                AirlinePartners(promotionData: airlinePartners),
                const SizedBox(height: 20,),
                const HotelSearchTravelGuide(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: MoreHelpSection(
                    hasBorder: true,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
