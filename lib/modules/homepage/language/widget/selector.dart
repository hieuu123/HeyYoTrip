import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/common/widget/fullscreen_loader.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';
import 'package:heyyo_trip/modules/homepage/language/extension/language_extension.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_bloc.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_event.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: LanguageEnum.values.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = LanguageEnum.values[index];
            // final isSelected = state.selectedLanguage == item;
            final currentCode = context.locale.languageCode;
            final isSelected = currentCode == item.code;

            return GestureDetector(
              onTap: () async {
                // 1. Hiển thị loader
                FullScreenLoader.show(context);

                // 2. Cập nhật bloc state (đổi highlight)
                context.read<LanguageBloc>().add(SelectLanguage(item));

                // 3. Đổi ngôn ngữ của easy_localization
                await context.setLocale(Locale(item.code));

                // 4. Ẩn loader khi xong
                FullScreenLoader.hide();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF2F9FF) : Colors.white,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(item.logo, width: 20, height: 20),
                    const SizedBox(width: 20),
                    Expanded(
                      child: SubHeadingText(
                        text: item.title,
                        fontsize: 16,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    if (isSelected)
                      SvgPicture.asset('assets/icons/tick.svg', width: 24),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
