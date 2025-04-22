import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/appbar.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/calendar_section.dart';
import 'package:heyyo_trip/modules/hotel/search/widget/checkin_checkout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightSelectDateScreen extends StatefulWidget {
  const FlightSelectDateScreen({super.key});

  @override
  State<FlightSelectDateScreen> createState() => _FlightSelectDateScreenState();
}

class _FlightSelectDateScreenState extends State<FlightSelectDateScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  @override
  void initState() {
    super.initState();
    final state = context.read<FlightDateBloc>().state;
    checkInDate = state.checkIn;
    checkOutDate = state.checkOut;
  }

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      if (checkInDate == null && checkOutDate == null) {
        // Lần tap đầu tiên
        checkInDate = selectedDate;
      } else if (checkInDate != null && checkOutDate == null) {
        // Lần tap thứ hai
        if (selectedDate.isAfter(checkInDate!)) {
          checkOutDate = selectedDate;
        } else {
          checkOutDate = checkInDate;
          checkInDate = selectedDate;
        }
      } else {
        // Đã có cả checkIn và checkOut, reset và bắt đầu range mới
        checkInDate = selectedDate;
        checkOutDate = null;
      }
    });
  }

  void _handleApply() {
    if (checkInDate != null && checkOutDate != null) {
      final nights = checkOutDate!.difference(checkInDate!).inDays;

      context.read<FlightDateBloc>().add(
            UpdateFlightDates(
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
          duration: Duration(milliseconds: 1750),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SelectDateAppBar(
        title: 'Select Date',
        icon: 'assets/icons/cancel.svg',
      ),
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
