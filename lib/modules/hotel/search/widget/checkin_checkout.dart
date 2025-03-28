import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:intl/intl.dart';

class CheckInCheckOutSummary extends StatelessWidget {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final VoidCallback onApply;

  const CheckInCheckOutSummary({
    super.key,
    this.checkIn,
    this.checkOut,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final nights = (checkIn != null && checkOut != null)
        ? checkOut!.difference(checkIn!).inDays
        : 0;

    String formatDate(DateTime? date) {
      return date != null ? DateFormat('EEE, dd yyyy').format(date) : '--';
    }

    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 10),
          child: Row(
            children: [
              _buildDateColumn('Check in', formatDate(checkIn)),
              const Spacer(),
              Column(
                children: [
                  SvgPicture.asset('assets/icons/arrow-right.svg'),
                  SubHeadingText(
                    text: '$nights night${nights == 1 ? '' : 's'}',
                    color: const Color(0xFF333333),
                  ),
                ],
              ),
              const Spacer(),
              _buildDateColumn('Check out', formatDate(checkOut)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: SecondaryButton(text: 'Apply', onPressed: onApply, fontsize: 14, vertical: 14,)
          ),
        )
      ],
    );
  }

  Widget _buildDateColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BodyText(
          text: title,
          color: const Color(0xFF747474),
          fontsize: 14,
        ),
        const SizedBox(height: 4),
        HeadingText(
          text: value,
          fontsize: 16,
          color: const Color(0xFF242426),
        ),
      ],
    );
  }
}
