import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/bookings/enum/bookings_enum.dart';

extension BookingsExtension on BookingsEnum {
  String get time {
    switch (this) {
      case BookingsEnum.timeSelector1:
        return '20 Dec 2021';
      case BookingsEnum.timeSelector2:
        return '31 Dec 2021';
      case BookingsEnum.timeSelector3:
        return '02 Feb 2022';
      case BookingsEnum.timeSelector4:
        return '03 Feb 2022';
    }
  }

  Widget get chosenWidget {
    switch (this) {
      case BookingsEnum.timeSelector1:
        return const SubHeadingText(
          text: 'Today',
          color: Colors.white,
          fontsize: 12,
        );
      case BookingsEnum.timeSelector2:
        return SvgPicture.asset('assets/icons/bookings-place.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));
      case BookingsEnum.timeSelector3:
        return SvgPicture.asset('assets/icons/bookings-flight.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));
      case BookingsEnum.timeSelector4:
        return SvgPicture.asset('assets/icons/bookings-car.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));
    }
  }

  Widget get notChosenWidget {
    switch (this) {
      case BookingsEnum.timeSelector1:
        return const SubHeadingText(
          text: 'Today',
          color: Color(0xFF3982D1),
          fontsize: 12,
        );
      case BookingsEnum.timeSelector2:
        return SvgPicture.asset('assets/icons/bookings-place.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF3982D1), BlendMode.srcIn));
      case BookingsEnum.timeSelector3:
        return SvgPicture.asset('assets/icons/bookings-flight.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF3982D1), BlendMode.srcIn));
      case BookingsEnum.timeSelector4:
        return SvgPicture.asset('assets/icons/bookings-car.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF3982D1), BlendMode.srcIn));
    }
  }

  List<int> get bookingsCount {
    switch (this) {
      case BookingsEnum.timeSelector1:
        return [16, 7, 9];
      case BookingsEnum.timeSelector2:
        return [12, 3, 8];
      case BookingsEnum.timeSelector3:
        return [6, 7, 8];
      case BookingsEnum.timeSelector4:
        return [9, 13, 10];
    }
  }

  static BookingsEnum fromIndex(int index) {
    switch (index) {
      case 0:
        return BookingsEnum.timeSelector1;
      case 1:
        return BookingsEnum.timeSelector2;
      case 2:
        return BookingsEnum.timeSelector3;
      case 3:
        return BookingsEnum.timeSelector4;
      default:
        throw ArgumentError('Invalid index: $index');
    }
  }

  List<Widget> get bigLogos {
    return [
      SvgPicture.asset(
        'assets/icons/bookings-place-big.svg',
      ),
      SvgPicture.asset(
        'assets/icons/bookings-flight-big.svg',
      ),
      SvgPicture.asset(
        'assets/icons/bookings-car-big.svg',
      ),
    ];
  }

  List<String> get counterTitle  {
    return ['Accommodation bookings', 'Flight bookings', 'Car bookings'];
  }
}
