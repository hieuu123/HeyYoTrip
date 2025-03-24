// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/help_center/view/help_center_details_screen.dart';
import 'package:heyyo_trip/modules/help_center/view/help_center_screen.dart';
import 'package:heyyo_trip/modules/hot_deals/view/promotion_code_details.dart';
import 'package:heyyo_trip/modules/hot_deals/view/special_campaign_details.dart';
// import 'package:heyyo_trip/modules/account_screen.dart';
// import 'package:heyyo_trip/modules/bookings_screen.dart';
// import 'package:heyyo_trip/modules/hot_deals_screen.dart';
import 'package:heyyo_trip/modules/login/view/login_screens.dart';
import 'package:heyyo_trip/modules/main/view/main_screen.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/profile/view/edit_profile_screen.dart';
import 'package:heyyo_trip/modules/profile/view/profile_screen.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: LoginScreen()),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const MainScreen(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: MainScreen()),
  ),
  GoRoute(
    path: '/help-center',
    builder: (context, state) => const HelpCenterScreen(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: HelpCenterScreen()),
  ),
  GoRoute(
    path: '/help-center/details/:category',
    builder: (context, state) {
      final category = HelpCategories.values.firstWhere(
        (e) => e.name == state.pathParameters['category'],
      );
      return HelpCenterDetailsScreen(category: category);
    },
  ),
  GoRoute(
    path: '/special-campaign-details',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      return SpecialCampaignDetails(
        title: extra?['title'] as String?,
        image: extra?['image'] as String?,
      );
    },
  ),
  GoRoute(
    path: '/promotion-details',
    builder: (context, state) => const PromotionCodeDetails(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: PromotionCodeDetails()),
  ),
  GoRoute(
    path: '/profile',
    builder: (context, state) => const ProfileScreen(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: ProfileScreen()),
  ),
  GoRoute(
    path: '/edit-profile',
    builder: (context, state) => const EditProfileScreen(),
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: EditProfileScreen()),
  ),
]);
