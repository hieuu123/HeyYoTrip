import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';

class HotDealsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  const HotDealsAppBar({this.bottom, super.key});

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
              text: 'Hot Deals',
              fontsize: 18,
              color: Color(0xFFFFFFFF),
            ),
          )
        ],
      ),
    );
  }
}

class CampaignDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String title;

  const CampaignDetailsAppBar({this.bottom, required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 72,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: const BoxDecoration(color: Colors.white),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset('assets/icons/back2.svg')),
      ),
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: SubHeadingText(
              text: title,
              fontsize: 16,
              color: Color(0xFF333333),
            ),
          )
        ],
      ),
    );
  }
}

class PromotionCodeDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String title;

  const PromotionCodeDetailsAppBar(
      {this.bottom, required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 72,
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
      leading: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset('assets/icons/back2.svg')),
      ),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SubHeadingText(
              text: title,
              fontsize: 16,
              color: const Color(0xFF333333),
            ),
          )
        ],
      ),
    );
  }
}
