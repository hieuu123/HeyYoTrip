import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/account_screen.dart';
import 'package:heyyo_trip/modules/bookings.dart';
import 'package:heyyo_trip/modules/hot_deals_screens.dart';
import 'package:heyyo_trip/modules/login/view/login_screens.dart';
import 'package:heyyo_trip/modules/home/view/home_screens.dart';
import 'package:heyyo_trip/common/widget/section.dart';


final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
      pageBuilder: (context, state) => NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/hot-deals',
      builder: (context, state) => const HotDealsScreen(),
      pageBuilder: (context, state) => NoTransitionPage(child: HotDealsScreen()),
    ),
    GoRoute(
      path: '/bookings',
      builder: (context, state) => const BookingsScreen(),
      pageBuilder: (context, state) => NoTransitionPage(child: BookingsScreen()),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
      pageBuilder: (context, state) => NoTransitionPage(child: AccountScreen()),
    ),
  ]
);