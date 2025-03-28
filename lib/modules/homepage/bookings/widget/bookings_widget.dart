import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
// import 'package:heyyo_trip/modules/homepage/bookings/enum/bookings_enum.dart';
import 'package:heyyo_trip/modules/homepage/bookings/extension/bookings_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_bloc.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_event.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_state.dart';

// class BookingsSelector extends StatefulWidget {
//   const BookingsSelector({super.key});

//   @override
//   State<BookingsSelector> createState() => BookingsSelectorState();
// }

class BookingsSelector extends StatelessWidget {
  const BookingsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        return Container(
          width: maxWidth - 32,
          height: 120,
          decoration: BoxDecoration(
            // color: Colors.red,
            color: const Color(0xFFF2F9FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                final selector = BookingsExtension.fromIndex(index);
                final isChosen = state.selectedStates[index];
                return GestureDetector(
                  onTap: () {
                    context.read<BookingsBloc>().add(SelectBookingTime(index));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: maxWidth / 7.5,
                        height: maxWidth / 7.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: isChosen
                                ? const Color(0xFF3982D1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(33),
                            border: isChosen
                                ? Border.all(color: const Color(0xFF3982D1))
                                : Border.all(
                                    color: Colors.transparent, width: 0)),
                        child: isChosen
                            ? selector.chosenWidget
                            : selector.notChosenWidget,
                      ),
                      const SizedBox(height: 8,),
                      isChosen
                          ? SubHeadingText(
                              text: selector.time,
                              fontsize: 12,
                              color: const Color(0xFF242426),
                            )
                          : BodyText(
                              text: selector.time,
                              fontsize: 12,
                              color: const Color(0xFF242426),
                            )
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
