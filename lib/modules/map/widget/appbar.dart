import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String description;

  const MapAppBar({super.key, required this.name, required this.description});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3982D1), Color(0xFF004E92)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 15, left: 0),
                  child: SvgPicture.asset(
                    'assets/icons/back4.svg',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: HeadingText(
                      text: name,
                      fontsize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6,),
                  BodyText(
                    text: description,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: SubHeadingText(
              text: 'Change',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
