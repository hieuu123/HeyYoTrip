// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/help_center/view/help_center_screen.dart';
// import 'package:heyyo_trip/modules/account_screen.dart';
// import 'package:heyyo_trip/modules/bookings_screen.dart';
// import 'package:heyyo_trip/modules/hot_deals_screen.dart';
import 'package:heyyo_trip/modules/login/view/login_screens.dart';
import 'package:heyyo_trip/modules/main/view/main_screen.dart';


final router = GoRouter(
  initialLocation: '/help-center',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
      pageBuilder: (context, state) => const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      pageBuilder: (context, state) => const NoTransitionPage(child: MainScreen()),
    ),
    GoRoute(
      path: '/help-center',
      builder: (context, state) => const HelpCenterScreen(),
      pageBuilder: (context, state) => const NoTransitionPage(child: HelpCenterScreen()),
    )
  ]
);