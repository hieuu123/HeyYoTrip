import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class BookingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const BookingsAppBar({this.bottom, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(78);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 78,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF3982D1), Color(0xFF004E92)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)
            // color: Color(0xFF004E92)
            ),
      ),
      title: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: HeadingText(
              text: 'My Booking',
              fontsize: 18,
              color: Color(0xFFFFFFFF),
            ),
          )
        ],
      ),
    );
  }
}