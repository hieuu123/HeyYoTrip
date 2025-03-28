import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class HotelSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const HotelSearchAppBar({this.bottom, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // centerTitle: true,
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF3982D1), Color(0xFF004E92)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
      ),
      title: Row(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(top: 27, bottom: 12, right: 15, left: 5),
              child: SvgPicture.asset(
                'assets/icons/back3.svg',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: SubHeadingText(
              text: 'Hotels',
              fontsize: 16,
              color: Color(0xFFFFFFFF),
            ),
          )
        ],
      ),
    );
  }
}

class SelectDateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const SelectDateAppBar({this.bottom, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(78);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 78,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF3982D1), Color(0xFF004E92)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
      ),
      leading: GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/cancel.svg',
              height: 16,
              width: 16,
            ),
          ),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(top: 30),
        child: HeadingText(
          text: 'Select Date',
          fontsize: 16,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
