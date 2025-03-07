import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/screens/account_screen.dart';
import 'package:heyyo_trip/screens/bookings.dart';
import 'package:heyyo_trip/screens/hot_deals_screens.dart';
import 'package:heyyo_trip/screens/login_screens.dart';
import 'package:heyyo_trip/screens/home_screens.dart';
import 'package:heyyo_trip/common/widget/section.dart';


final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen()
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen()
    ),
    GoRoute(
      path: '/hot-deals',
      builder: (context, state) => const HotDealsScreen(),
    ),
    GoRoute(
      path: '/bookings',
      builder: (context, state) => const BookingsScreen(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
    ),
  ]
);