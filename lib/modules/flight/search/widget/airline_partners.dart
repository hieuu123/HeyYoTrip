import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:dotted_border/dotted_border.dart';

class AirlinePartners extends StatelessWidget {
  final List<List<String>> promotionData;
  final double left;
  final double right;

  const AirlinePartners(
      {required this.promotionData, this.left = 16, this.right = 0, super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as CategoryInitial).selectedIndex;
        List<String> selectedPromotions = promotionData[selectedIndex];

        return SizedBox(
          height: maxWidth / 4.1,
          child: Padding(
            padding: EdgeInsets.only(left: left, right: right),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedPromotions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index < selectedPromotions.length - 1 ? 10 : 0),
                  child: DottedBorder(
                    color: const Color(0xFFE1E1E1),
                    strokeWidth: 1,
                    dashPattern: const [4, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(5),
                    child: Container(
                      alignment: Alignment.center,
                      width: maxWidth / 4.1,
                      height: maxWidth / 4.1,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          selectedPromotions[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
