import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:intl/intl.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    void swapFlyingFromAndTo() {
      final bloc = context.read<FlightSearchBloc>();
      final state = bloc.state;

      if (state is FlightSearchLoaded) {
        bloc.add(UpdateFromPlaceEvent(
          place: state.toPlace ?? '',
          code: state.toCode ?? '',
        ));

        bloc.add(UpdateToPlaceEvent(
          place: state.fromPlace ?? '',
          code: state.fromCode ?? '',
        ));
      }
    }

    return BlocBuilder<FlightDateBloc, FlightDateState>(
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
        height: 370,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFFD7D7D7),
              // color: Coslors.red,
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
                      SvgPicture.asset('assets/icons/flight-takeoff.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      BlocBuilder<FlightSearchBloc, FlightSearchState>(
                        builder: (context, flightState) {
                          final fromText =
                              '${(flightState as FlightSearchLoaded).fromPlace} (${flightState.fromCode})';

                          return GestureDetector(
                            onTap: () async {
                              final result = await GoRouter.of(context)
                                  .push<Map<String, String>>(
                                '/select-place',
                                extra: 'from',
                              );
                              if (result != null && context.mounted) {
                                context.read<FlightSearchBloc>().add(
                                      UpdateFromPlaceEvent(
                                        place: result['place'] ?? '',
                                        code: result['code'] ?? '',
                                      ),
                                    );
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BodyText(text: 'Flying from'),
                                SubHeadingText(
                                  text: fromText,
                                  fontsize: 16,
                                  color: const Color(0xFF333333),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFEDEDED),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                          onTap: () => swapFlyingFromAndTo(),
                          child:
                              SvgPicture.asset('assets/icons/arrow-swap.svg')),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/flight-landing.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      BlocBuilder<FlightSearchBloc, FlightSearchState>(
                        builder: (context, flightState) {
                          final toText =
                              '${(flightState as FlightSearchLoaded).toPlace} (${flightState.toCode})';

                          return GestureDetector(
                            onTap: () async {
                              final result = await GoRouter.of(context)
                                  .push<Map<String, String>>(
                                '/select-place',
                                extra: 'to',
                              );
                              if (result != null && context.mounted) {
                                context.read<FlightSearchBloc>().add(
                                      UpdateToPlaceEvent(
                                        place: result['place'] ?? '',
                                        code: result['code'] ?? '',
                                      ),
                                    );
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BodyText(text: 'Flying to'),
                                SubHeadingText(
                                  text: toText,
                                  fontsize: 16,
                                  color: const Color(0xFF333333),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 14),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFEDEDED),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  // color: Colors.red,
                  width: maxWidth < 390 ? maxWidth - 0 : maxWidth - 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/hotel-search-calendar.svg'),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => GoRouter.of(context).push(
                                '/flight/search/select-date',
                                extra:
                                    BlocProvider.of<FlightDateBloc>(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BodyText(text: 'Departure date'),
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
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        height: 45,
                        child: VerticalDivider(
                          thickness: 1,
                          color: Color(0xFFEDEDED),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => GoRouter.of(context).push(
                                '/flight/search/select-date',
                                extra:
                                    BlocProvider.of<FlightDateBloc>(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BodyText(text: 'Return date'),
                                SubHeadingText(
                                  text: checkOutText,
                                  fontsize: 16,
                                  color: const Color(0xFF333333),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 23),
                            child: BodyText(text: 'Round-trip'),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -12),
                            child: Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                  value: light,
                                  activeColor: Colors.white,
                                  activeTrackColor: const Color(0xFF3982D1),
                                  inactiveThumbColor: const Color(0xFF3982D1),
                                  inactiveTrackColor: Colors.white,
                                  onChanged: (bool value) {
                                    setState(() {
                                      light = value;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 14),
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
                  GestureDetector(
                    onTap: () async {
                      await GoRouter.of(context).push('/select-passenger');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyText(text: 'Passenger'),
                        BlocBuilder<SelectPassengerBloc, SelectPassengerState>(
                          builder: (context, state) {
                            return SubHeadingText(
                              text:
                                  '${state.adult} adults - ${state.children} children - ${state.infant} Infant',
                              fontsize: 16,
                              color: const Color(0xFF333333),
                            );
                          },
                        ),
                      ],
                    ),
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
