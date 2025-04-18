import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class PopularDestinations extends StatelessWidget {
  final List<List<String>> promotionData;
  final List<String> title;
  final double left;
  final double right;

  const PopularDestinations(
      {required this.promotionData,
      required this.title,
      this.left = 16,
      this.right = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        int selectedIndex = (state as CategoryInitial).selectedIndex;
        List<String> selectedPromotions = promotionData[selectedIndex];

        return SizedBox(
          height: maxWidth / 1.65,
          child: Padding(
            padding: EdgeInsets.only(left: left, right: right),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedPromotions.length,
              itemBuilder: (context, index) {
                return Stack(alignment: Alignment.center, children: [
                  Container(
                    alignment: Alignment.center,
                    margin: (index < selectedPromotions.length - 1)
                        ? const EdgeInsets.only(right: 10)
                        : null,
                    width: maxWidth / 1.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(selectedPromotions[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: SubHeadingText(
                    //   text: title[index],
                    //   fontsize: 24,
                    //   color: Colors.white,
                    // ),
                  ),
                  Container(
                    width: maxWidth / 1.45,
                    margin: (index < selectedPromotions.length - 1)
                        ? const EdgeInsets.only(right: 10)
                        : null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withOpacity(0.4), // lớp phủ tối
                    ),
                  ),
                  SubHeadingText(
                    text: title[index],
                    fontsize: 24,
                    color: Colors.white,
                  ),
                ]);
              },
            ),
          ),
        );
      },
    );
  }
}
