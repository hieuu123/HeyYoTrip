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

class LanguageSelector extends StatelessWidget {
  /// Nếu được gọi từ màn Login, popOnSelect = true để nav.pop()
  final bool popOnSelect;
  const LanguageSelector({super.key, this.popOnSelect = false});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LanguageBloc, LanguageState>(
      listener: (context, state) {
        // Ẩn loader khi locale đã được cập nhật
        FullScreenLoader.hide();
        // Đóng selector nếu cần
        if (popOnSelect) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: LanguageEnum.values.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = LanguageEnum.values[index];
              final isSelected = state.locale.languageCode == item.code;

              return GestureDetector(
                onTap: () {
                  // Hiển thị loader
                  FullScreenLoader.show(context);
                  // Dispatch sự kiện thay đổi ngôn ngữ
                  context.read<LanguageBloc>().add(SelectLanguage(item));
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
                          text: item.title(context),
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
      ),
    );
  }
}
