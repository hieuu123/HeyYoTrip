import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';

class SelectPassenger extends StatelessWidget {
  const SelectPassenger({super.key});

  @override
  Widget build(BuildContext context) {
    // final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SelectDateAppBar(
        title: 'Choose passenger',
        icon: 'assets/icons/back3.svg',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xFFD7D7D7)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: BlocBuilder<SelectPassengerBloc, SelectPassengerState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _buildRow(context, 'Adult(s)', null, state.adult, 1, 9,
                          onDecrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateAdultCount(state.adult - 1)),
                          onIncrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateAdultCount(state.adult + 1))),
                      _buildRow(context, 'Children(s)', 'Ages 2 - 12',
                          state.children, 0, 9,
                          onDecrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateChildrenCount(state.children - 1)),
                          onIncrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateChildrenCount(state.children + 1))),
                      _buildRow(context, 'Infant(s)', 'Under age 2',
                          state.infant, 0, 9,
                          onDecrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateInfantCount(state.infant - 1)),
                          onIncrement: () => context
                              .read<SelectPassengerBloc>()
                              .add(UpdateInfantCount(state.infant + 1))),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3982D1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  final state = context.read<SelectPassengerBloc>().state;
                  Navigator.pop(context, {
                    'adults': state.adult,
                    'children': state.children,
                    'infants': state.infant,
                  });
                },
                child: const SubHeadingText(text: 'Apply', color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String? subLabel,
      int value, int min, int max,
      {required VoidCallback onDecrement, required VoidCallback onIncrement}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                text: label,
                fontsize: 16,
                color: const Color(0xFF5C5C5C),
              ),
              if (subLabel != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: BodyText(
                      text: subLabel,
                      fontsize: 12,
                      color: const Color(0xFF5C5C5C)),
                ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: min < value && value <= max
                            ? const Color(0xFF3982D1)
                            : const Color(0xFFEDEDED),
                        width: 1)),
                child: IconButton(
                  padding: EdgeInsets.zero, // ✅ Xoá padding mặc định
                  constraints: const BoxConstraints(), // ✅ Tránh bị ép size lớn
                  icon: Icon(
                    Icons.remove,
                    size: 18, // Optional: tuỳ chỉnh size icon nhỏ hơn nếu cần
                    color: value > min
                        ? const Color(0xFF3982D1)
                        : const Color(0xFFEDEDED),
                  ),
                  onPressed: value > min ? onDecrement : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BodyText(
                  text: '$value',
                  fontsize: 18,
                  color: const Color(0xFF242426),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: min <= value && value < max
                            ? const Color(0xFF3982D1)
                            : const Color(0xFFEDEDED),
                        width: 1)),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 18,
                    color: value < max
                        ? const Color(0xFF3982D1)
                        : const Color(0xFFEDEDED),
                  ),
                  onPressed: value < max ? onIncrement : null,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
