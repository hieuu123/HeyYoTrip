import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/modules/home/view/home_screen.dart';
import 'package:heyyo_trip/modules/hot_deals_screen.dart';
import 'package:heyyo_trip/modules/bookings_screen.dart';
import 'package:heyyo_trip/modules/account/view/account_screen.dart';
// import 'package:heyyo_trip/common/widget/appBar.dart';
import 'package:heyyo_trip/common/widget/section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HotDealsScreen(),
    const BookingsScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const HomeAppBar(),
      body: IndexedStack(
        index: _selectedIndex, // ✅ Giữ trạng thái của từng màn hình
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
