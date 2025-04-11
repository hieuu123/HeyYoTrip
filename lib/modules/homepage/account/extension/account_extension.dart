import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_event.dart';
import 'package:heyyo_trip/modules/homepage/account/enum/account_enum.dart';
import 'package:go_router/go_router.dart';

extension AccountOptionExtension on AccountOption {
  String get icon {
    switch (this) {
      case AccountOption.profile:
        return 'assets/icons/profile-account.svg';
      case AccountOption.maps:
        return 'assets/icons/language-account.svg';
      case AccountOption.points:
        return 'assets/icons/points-account.svg';
      case AccountOption.promotionCode:
        return 'assets/icons/code-account.svg';
      case AccountOption.language:
        return 'assets/icons/language-account.svg';
      case AccountOption.currency:
        return 'assets/icons/currency-account.svg';
      case AccountOption.contactUs:
        return 'assets/icons/contact-account.svg';
      case AccountOption.helpCenter:
        return 'assets/icons/help-account.svg';
      case AccountOption.privacyPolicy:
        return 'assets/icons/privacy-account.svg';
      case AccountOption.terms:
        return 'assets/icons/term-account.svg';
      case AccountOption.about:
        return 'assets/icons/about-account.svg';
      case AccountOption.settings:
        return 'assets/icons/setting-account.svg';
      case AccountOption.logout:
        return 'assets/icons/logout-account.svg';
    }
  }

  String get title {
    switch (this) {
      case AccountOption.profile:
        return 'Profile';
      case AccountOption.maps:
        return 'Maps';
      case AccountOption.points:
        return 'My points';
      case AccountOption.promotionCode:
        return 'My promotion code';
      case AccountOption.language:
        return 'Language';
      case AccountOption.currency:
        return 'Currency';
      case AccountOption.contactUs:
        return 'Contact us';
      case AccountOption.helpCenter:
        return 'Help Center';
      case AccountOption.privacyPolicy:
        return 'Privacy policy';
      case AccountOption.terms:
        return 'Term and conditions';
      case AccountOption.about:
        return 'About us';
      case AccountOption.settings:
        return 'Setting';
      case AccountOption.logout:
        return 'Log out';
    }
  }

  Color get color {
    return this == AccountOption.logout
        ? const Color(0xFFDC3545)
        : const Color(0xFF666666);
  }

  bool get needsDivider {
    return this == AccountOption.currency || this == AccountOption.helpCenter;
  }

  void Function()? onTap(BuildContext context) {
    switch (this) {
      case AccountOption.profile:
        return () => GoRouter.of(context).push('/profile');
      case AccountOption.maps:
        return () => GoRouter.of(context).push('/maps');
      case AccountOption.points:
        return () => GoRouter.of(context).push('/points');
      case AccountOption.promotionCode:
        return () => GoRouter.of(context).push('/promotion-code');
      case AccountOption.language:
        return () => GoRouter.of(context).push('/language');
      case AccountOption.currency:
        return () => GoRouter.of(context).push('/currency');
      case AccountOption.contactUs:
        return () => GoRouter.of(context).push('/contact-us');
      case AccountOption.helpCenter:
        return () => GoRouter.of(context).push('/help-center');
      case AccountOption.privacyPolicy:
        return () => GoRouter.of(context).push('/privacy-policy');
      case AccountOption.terms:
        return () => GoRouter.of(context).push('/terms');
      case AccountOption.about:
        return () => GoRouter.of(context).push('/about');
      case AccountOption.settings:
        return () => GoRouter.of(context).push('/settings');
      case AccountOption.logout:
        return () {
          context.read<AuthBloc>().add(LogoutEvent());
          GoRouter.of(context).go('/login');
        };
    }
  }
}
