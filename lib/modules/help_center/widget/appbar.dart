import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class HelpCenterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HelpCenterAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/back2.svg')),
      title: const HeadingText(
        text: 'Help Center',
        color: Color(0xFF0D276E),
        fontsize: 20,
      ),
      shape: const Border(
          bottom: BorderSide(
              color: Color.fromARGB(255, 216, 216, 220),
              width: 1,
              style: BorderStyle.solid)),
    );
  }
}