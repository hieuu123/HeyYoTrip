import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_event.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/calendar_section.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/checkin_checkout.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      if (checkInDate == null ||
          (checkInDate != null && checkOutDate != null)) {
        checkInDate = selectedDate;
        checkOutDate = null;
      } else if (selectedDate.isAfter(checkInDate!)) {
        checkOutDate = selectedDate;
      } else {
        checkInDate = selectedDate;
        checkOutDate = null;
      }
    });
  }

  void _handleApply() {
    if (checkInDate != null && checkOutDate != null) {
      final nights = checkOutDate!.difference(checkInDate!).inDays;

      context.read<SearchDateBloc>().add(
            UpdateSearchDates(
              checkIn: checkInDate!,
              checkOut: checkOutDate!,
              nights: nights,
            ),
          );

      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn đủ ngày check-in và check-out'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SelectDateAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: CalendarContainer(
                checkIn: checkInDate,
                checkOut: checkOutDate,
                onDateTap: _onDateSelected,
              ),
            ),
          ),
          CheckInCheckOutSummary(
            checkIn: checkInDate,
            checkOut: checkOutDate,
            onApply: _handleApply,
          ),
        ],
      ),
    );
  }
}