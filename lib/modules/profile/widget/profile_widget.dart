import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/common/widget/button.dart';

class AvatarFrame extends StatelessWidget {
  const AvatarFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: maxWidth / 6.4,
              height: maxWidth / 6.4,
              decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(50)),
            ),
            SvgPicture.asset(
              'assets/icons/profile-person.svg',
              width: maxWidth / 20.5,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    // height: maxWidth / 20,
                    // width: maxWidth / 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(33)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: SvgPicture.asset(
                        'assets/icons/profile-camera.svg',
                        width: maxWidth / 26,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

class RowButtons extends StatelessWidget {
  final VoidCallback onSave;

  const RowButtons({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                  top: BorderSide(
                      width: 0.5, color: Colors.black.withOpacity(0.15)))),
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SecondaryButton(
                      text: 'Cancel',
                      onPressed: () => GoRouter.of(context).pop(),
                      textColor: const Color(0xFF8F9098),
                      color: const Color(0xFFEDEDED),
                      borderColor: const Color(0xFFEDEDED),
                      vertical: 8,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SecondaryButton(
                      text: 'Save',
                      onPressed: onSave,
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
