import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';


class SignInAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignInAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(74);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 74,
      backgroundColor: Colors.white,
      shape: const Border(
          bottom: BorderSide(
              color: Color.fromARGB(255, 216, 216, 220),
              width: 1,
              style: BorderStyle.solid)),
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 12,
            height: 12,
          )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/logo.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/logo_text.svg'),
            ),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset('assets/icons/language.svg'))
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(72);
  @override   
  Widget build (BuildContext context) {
    return AppBar(
        toolbarHeight: 72,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF67CEFD), Color(0xFF155FD1)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)
              // color: Colors.red
                  ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: SvgPicture.asset('assets/icons/logo-full.svg'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 24),
            child: IconButton(
                onPressed: () {},
                icon: Badge(
                  backgroundColor: Color(0xFFDC3545),
                  child: SvgPicture.asset('assets/icons/bell.svg'),
                )),
          )
        ],
      );
  }
}

class HeaderNav extends StatelessWidget {
  const HeaderNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF67CEFD), Color(0xFF155FD1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)
          // color: Colors.red
          ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset('assets/icons/round-shape.svg'),
                  SvgPicture.asset('assets/icons/hotel.svg')
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SubHeadingText(
                    text: 'Hotels',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset('assets/icons/round-shape.svg'),
                  SvgPicture.asset('assets/icons/flight.svg')
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SubHeadingText(
                    text: 'Flights',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset('assets/icons/round-shape.svg'),
                  SvgPicture.asset('assets/icons/f&h.svg')
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SubHeadingText(
                    text: 'F&H Combo',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset('assets/icons/round-shape.svg'),
                  SvgPicture.asset('assets/icons/tours.svg')
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SubHeadingText(
                    text: 'Tours',
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
