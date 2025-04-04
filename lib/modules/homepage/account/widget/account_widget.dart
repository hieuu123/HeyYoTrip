import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({super.key});

  Future<String> fetchUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final data = doc.data();
      if (data != null) {
        return '${data['lastName']} ${data['firstName']}';
      }
    }
    return 'User';
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 130,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF67CEFD), Color(0xFF155FD1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)
            // color: Colors.red
            ),
      ),
      title: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset('assets/icons/avt-background.svg'),
              SvgPicture.asset('assets/icons/avt.svg'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: FutureBuilder<String>(
              future: fetchUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SubHeadingText(
                    text: 'Loading...',
                    fontsize: 18,
                    color: Color(0xFFFFFFFF),
                  );
                } else if (snapshot.hasError) {
                  return const SubHeadingText(
                    text: 'Error',
                    fontsize: 18,
                    color: Color(0xFFFFFFFF),
                  );
                } else {
                  return SubHeadingText(
                    text: snapshot.data ?? 'User',
                    fontsize: 18,
                    color: const Color(0xFFFFFFFF),
                  );
                }
              },
            ),
          )
        ],
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Badge(
                    backgroundColor: const Color(0xFFDC3545),
                    child: SvgPicture.asset('assets/icons/bell.svg'),
                  )),
            ),
          ],
        )
      ],
    );
  }
}

class AccountOptions extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const AccountOptions(
      {required this.icon,
      required this.title,
      this.color = const Color(0xFF666666),
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: BodyText(
            text: title,
            color: color,
          )),
          IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset('assets/icons/forward.svg'))
        ],
      ),
    );
  }
}
