import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class LanguageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LanguageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(77);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 77,
      backgroundColor: Colors.white,
      shape: const Border(
          bottom: BorderSide(
              color: Color(0xFFD8D8DC),
              width: 1,
              style: BorderStyle.solid)),
      leading: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: SvgPicture.asset(
              'assets/icons/back2.svg',
              width: 16,
              height: 16,
            )),
      ),
      title: const Padding(
        padding: EdgeInsets.only(top: 25),
        child: HeadingText(text: 'Language', fontsize: 20, color: Color(0xFF0D276E),),
      )
    );
  }
}