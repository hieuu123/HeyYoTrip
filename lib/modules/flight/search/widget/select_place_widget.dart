import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:heyyo_trip/modules/flight/search/enum/search_enum.dart';
import 'package:heyyo_trip/modules/flight/search/extension/search_extension.dart';

class SelectPlaceRecentSearch extends StatelessWidget {
  const SelectPlaceRecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeadingText(
            text: 'Current Location / Recent Search',
            color: Colors.black,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/pin-map-location.svg'),
              const SizedBox(width: 4),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeadingText(
                    text: 'Ho Chi Minh',
                    color: Color(0xFF333333),
                  ),
                  BodyText(
                    text: 'Vietnam',
                    fontsize: 12,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectPlacePoluparCities extends StatelessWidget {
  final String selectionType;
  const SelectPlacePoluparCities({required this.selectionType, super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeadingText(
          text: 'Popular Cities or Airports',
          color: Colors.black,
        ),
        SizedBox(
          width: maxWidth - 32,
          height: maxHeight - 333,
          child: ListView.builder(
              itemCount: PopularCitiesCountry.values.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final country = PopularCitiesCountry.values[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        BodyText(
                          text: country.country,
                          color: const Color(0xFF333333),
                        ),
                        const Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Color(0xFFEDEDED),
                        ))
                      ],
                    ),
                    const SizedBox(height: 25),
                    ...country.details.map((city) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: GestureDetector(
                          onTap: () {
                            final isSelectingFrom = selectionType == 'from';
                            context.read<FlightSearchBloc>().add(
                                  isSelectingFrom
                                      ? UpdateFromPlaceEvent(
                                          place: city['title']!,
                                          code: city['code']!,
                                        )
                                      : UpdateToPlaceEvent(
                                          place: city['title']!,
                                          code: city['code']!,
                                        ),
                                );

                            Navigator.pop(context, {
                              'place': city['title'] ?? '',
                              'code': city['code'] ?? '',
                            }); // Pop về search_screen
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/airplane-takeoff.svg'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  BodyText(
                                    text: '${city['title']}',
                                    color: const Color(0xFF333333),
                                  )
                                ],
                              ),
                              SubHeadingText(
                                text: '${city['code']}',
                                color: const Color(0xFF333333),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                );
              }),
        )
      ],
    );
  }
}
