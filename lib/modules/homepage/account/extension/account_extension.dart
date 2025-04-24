import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_event.dart';
import 'package:heyyo_trip/common/widget/fullscreen_loader.dart';
import 'package:heyyo_trip/modules/homepage/account/enum/account_enum.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String title(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case AccountOption.profile:
        return l10n.accountProfile;
      case AccountOption.maps:
        return l10n.accountMaps;
      case AccountOption.points:
        return l10n.accountPoints;
      case AccountOption.promotionCode:
        return l10n.accountPromotionCode;
      case AccountOption.language:
        return l10n.accountLanguage;
      case AccountOption.currency:
        return l10n.accountCurrency;
      case AccountOption.contactUs:
        return l10n.accountContactUs;
      case AccountOption.helpCenter:
        return l10n.accountHelpCenter;
      case AccountOption.privacyPolicy:
        return l10n.accountPrivacyPolicy;
      case AccountOption.terms:
        return l10n.accountTerms;
      case AccountOption.about:
        return l10n.accountAbout;
      case AccountOption.settings:
        return l10n.accountSettings;
      case AccountOption.logout:
        return l10n.accountLogout;
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
          FullScreenLoader.show(context);
          context.read<AuthBloc>().add(LogoutEvent());
          GoRouter.of(context).go('/login');
        };
    }
  }
}
