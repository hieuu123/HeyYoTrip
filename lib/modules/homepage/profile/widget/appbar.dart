import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String title;

  const ProfileAppBar({this.bottom, required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 74,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Color(0xFFD8D8DC),
              width: 1,
            ))),
      ),
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset('assets/icons/back2.svg')),
      title: Column(
        children: [
          SubHeadingText(
            text: title,
            fontsize: 18,
            color: const Color(0xFF333333),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => GoRouter.of(context).push('/edit-profile'),
            child: const SubHeadingText(
              text: 'Edit',
              fontsize: 16,
              color: Color(0xFF3982D1),
            ))
      ],
    );
  }
}

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String title;

  const EditProfileAppBar({this.bottom, required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 74,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Color(0xFFD8D8DC),
              width: 1,
            ))),
      ),
      title: Column(
        children: [
          SubHeadingText(
            text: title,
            fontsize: 18,
            color: const Color(0xFF333333),
          )
        ],
      ),
    );
  }
}
