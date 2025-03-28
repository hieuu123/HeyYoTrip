import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:intl/intl.dart';

class CalendarContainer extends StatelessWidget {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Function(DateTime) onDateTap;

  const CalendarContainer({
    super.key,
    this.checkIn,
    this.checkOut,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final List<DateTime> months = List.generate(
      13,
      (index) => DateTime(now.year, now.month + index, 1),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: months
            .map((month) => CalendarMonthView(
                  month: month,
                  checkIn: checkIn,
                  checkOut: checkOut,
                  onDateTap: onDateTap,
                ))
            .toList(),
      ),
    );
  }
}

class CalendarMonthView extends StatelessWidget {
  final DateTime month;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Function(DateTime) onDateTap;

  const CalendarMonthView({
    super.key,
    required this.month,
    this.checkIn,
    this.checkOut,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDay.day;

    final int weekdayOffset = firstDay.weekday % 7;
    final int totalDays = weekdayOffset + daysInMonth;
    final int rows = (totalDays / 7).ceil();
    final int remainingCells = rows * 7 - totalDays;

    final List<DateTime> dates = [];

    // Ngày của tháng trước
    final DateTime prevMonth = DateTime(month.year, month.month - 1);
    final int prevMonthLastDay =
        DateTime(prevMonth.year, prevMonth.month + 1, 0).day;
    for (int i = weekdayOffset - 1; i >= 0; i--) {
      dates
          .add(DateTime(prevMonth.year, prevMonth.month, prevMonthLastDay - i));
    }

    // Ngày của tháng hiện tại
    for (int day = 1; day <= daysInMonth; day++) {
      dates.add(DateTime(month.year, month.month, day));
    }

    // Ngày của tháng sau
    for (int i = 1; i <= remainingCells; i++) {
      dates.add(DateTime(month.year, month.month + 1, i));
    }

    final now = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE3E3E3)),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 5),
        child: Column(
          children: [
            SubHeadingText(
              text: DateFormat.yMMMM().format(month),
              color: const Color(0xFF333333),
            ),
            const SizedBox(height: 25),
            _buildDayOfWeekHeader(),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: dates.map((date) {
                final bool isCurrentMonth = date.month == month.month;
                final bool isToday = date.day == now.day &&
                    date.month == now.month &&
                    date.year == now.year;
                final bool isSelected = (checkIn != null &&
                        date.day == checkIn!.day &&
                        date.month == checkIn!.month &&
                        date.year == checkIn!.year &&
                        date.month == month.month &&
                        date.year == month.year) ||
                    (checkOut != null &&
                        date.day == checkOut!.day &&
                        date.month == checkOut!.month &&
                        date.year == checkOut!.year &&
                        date.month == month.month &&
                        date.year == month.year);
                final bool isInRange = checkIn != null &&
                    checkOut != null &&
                    date.isAfter(checkIn!) &&
                    date.isBefore(checkOut!) &&
                    date.month == month.month &&
                    date.year == month.year;
                return GestureDetector(
                  onTap: () {
                    if (isCurrentMonth) {
                      onDateTap(date);
                    }
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: isToday
                            ? Border.all(color: const Color(0xFF3982D1))
                            : null,
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected
                            ? const Color(0xFF3982D1)
                            : isInRange
                                ? const Color(0xFFEFEFEF)
                                : isToday
                                    ? const Color(0xFFF2F9FF)
                                    : null,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: BodyText(
                        text: date.day.toString().padLeft(2, '0'),
                        color: isSelected
                            ? Colors.white
                            : !isCurrentMonth
                                ? const Color(0xFFD7D7D7)
                                : const Color(0xFF333333),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayOfWeekHeader() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((day) => Expanded(
                child: Center(
                  child: BodyText(
                    text: day,
                    color: const Color(0xFF333333),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
