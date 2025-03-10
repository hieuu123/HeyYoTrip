import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Color(0xFFD7D7D7))),
      ),
      child: NavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: onItemTapped, // ✅ Gọi setState từ MainScreen
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/home-unselected.svg'),
            selectedIcon: SvgPicture.asset('assets/icons/home-selected.svg'),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/hot-deals-unselected.svg'),
            selectedIcon: SvgPicture.asset('assets/icons/hot-deals-selected.svg'),
            label: 'Hot Deals',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/bookings-unselected.svg'),
            selectedIcon: SvgPicture.asset('assets/icons/bookings-selected.svg'),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icons/account-unselected.svg'),
            selectedIcon: SvgPicture.asset('assets/icons/account-selected.svg'),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
