import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_state.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDateBloc, SearchDateState>(
        builder: (context, state) {
      final checkInText = state.checkIn != null
          ? DateFormat('MMM dd, yyyy').format(state.checkIn!)
          : 'Select date';

      final checkOutText = state.checkOut != null
          ? DateFormat('MMM dd, yyyy').format(state.checkOut!)
          : 'Select date';

      final maxWidth = MediaQuery.of(context).size.width;
      return Container(
        width: maxWidth - 32,
        height: 260,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFFD7D7D7),
              // color: Colors.red,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/hotel-search-map.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BodyText(text: 'Where are you going?'),
                          SubHeadingText(
                            text: 'Ha Noi, Vietnam',
                            fontsize: 16,
                            color: Color(0xFF333333),
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/icons/my-location.svg'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFEDEDED),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icons/hotel-search-calendar.svg'),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => GoRouter.of(context).push(
                              '/hotel/search/select-date',
                              extra: BlocProvider.of<SearchDateBloc>(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BodyText(text: 'Check in'),
                              SubHeadingText(
                                text: checkInText,
                                fontsize: 16,
                                color: const Color(0xFF333333),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: const Color(0xFFD7D7D7), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: BodyText(
                              text: state.nights == 0 
                                  ? '0 night'
                                  : state.nights == 1 
                                      ? '1 night' 
                                      : '${state.nights} nights',
                              fontsize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => GoRouter.of(context).push(
                              '/hotel/search/select-date',
                              extra: BlocProvider.of<SearchDateBloc>(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BodyText(text: 'Check out'),
                              SubHeadingText(
                                text: checkOutText,
                                fontsize: 16,
                                color: const Color(0xFF333333),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFEDEDED),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                      'assets/icons/hotel-search-group-people.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(text: 'Guests & Rooms'),
                      SubHeadingText(
                        text: '2 adults - 0 children - 1 room',
                        fontsize: 16,
                        color: Color(0xFF333333),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
