import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/bookings/blocs/bookings_bloc.dart';
import 'package:heyyo_trip/modules/bookings/blocs/bookings_state.dart';
// import 'package:heyyo_trip/modules/bookings/enum/bookings_enum.dart';
import 'package:heyyo_trip/modules/bookings/extension/bookings_extension.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class BookingsCounter extends StatelessWidget {
  const BookingsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BookingsBloc, BookingsState>(builder: (context, state) {
      final selectedIndex = state.selectedStates.indexOf(true);
      final selector = BookingsExtension.fromIndex(selectedIndex);
      final counts = selector.bookingsCount;

      return Column(
        children: List.generate(3, (index) {
          return Container(
            width: maxWidth - 32,
            height: 80,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: const Color(0xFFD7D7D7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    selector.bigLogos[index],
                    const SizedBox(width: 20,),
                    BodyText(
                      text: selector.counterTitle[index],
                      fontsize: 16,
                      color: const Color(0xFF242426),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: const Color(0xFFF2F9FF)
                  ),
                  child: SubHeadingText(
                    text: '${counts[index]}',
                    fontsize: 14,
                    color: const Color(0xFF3982D1),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
