import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/help_center/extension/help_center_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';


class HelpCategory extends StatelessWidget {
  final String icon1;
  final String icon2;
  final String title;
  final HelpCategories category;

  const HelpCategory(
      {required this.icon1,
      required this.icon2,
      required this.title,
      required this.category,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push('/help-center/details/${category.name}'),
      child: Container(
        alignment: Alignment.center,
        color: const Color(0xFFFAFAFA),
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(icon1),
                SvgPicture.asset(icon2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: BodyText(text: title),
            )
          ],
        ),
      ),
    );
  }
}

class HelpCategorySection extends StatelessWidget {
  const HelpCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.75),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: HelpCategories.values.length,
            itemBuilder: (context, index) {
              var category = HelpCategories.values[index];
              return HelpCategory(
                  icon1: category.icon1,
                  icon2: category.icon2,
                  title: category.title,
                  category: category,);
            }),
      ],
    );
  }
}