import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/modules/homepage/help_center/view/help_center_details_screen.dart';
import 'package:heyyo_trip/modules/homepage/help_center/view/help_center_screen.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/view/promotion_code_details.dart';
import 'package:heyyo_trip/modules/homepage/hot_deals/view/special_campaign_details.dart';
import 'package:heyyo_trip/modules/homepage/login/view/login_screen.dart';
import 'package:heyyo_trip/modules/homepage/login/view/signup_screen.dart';
import 'package:heyyo_trip/modules/homepage/main/view/main_screen.dart';
import 'package:heyyo_trip/modules/homepage/help_center/enum/help_center_enum.dart';
import 'package:heyyo_trip/modules/homepage/profile/view/edit_profile_screen.dart';
import 'package:heyyo_trip/modules/homepage/profile/view/profile_screen.dart';
import 'package:heyyo_trip/modules/hotel/search/view/search_screen.dart';
import 'package:heyyo_trip/modules/hotel/search/view/select_date_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

GoRouter buildRouter({required String initialLocation}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
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
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignUpScreen()),
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
      GoRoute(
        path: '/hotel/search',
        builder: (context, state) => const HotelSearchScreen(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HotelSearchScreen()),
      ),
      GoRoute(
        path: '/hotel/search/select-date',
        builder: (context, state) => const SelectDateScreen(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SelectDateScreen()),
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
        path: '/promotion-details',
        builder: (context, state) => const PromotionCodeDetails(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: PromotionCodeDetails()),
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
    ],
  );
}
