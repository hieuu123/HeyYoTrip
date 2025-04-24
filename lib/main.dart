import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_bloc.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_event.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_state.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';
import 'package:heyyo_trip/config/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final user = await PreferencesManager.getUser();
  final isLoggedIn = FirebaseAuth.instance.currentUser != null && user != null;

  // khởi LanguageBloc để load locale đã lưu
  final languageBloc = LanguageBloc()..add(LoadSavedLocale());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: languageBloc),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => BottomNavBloc()),
        BlocProvider(create: (_) => CategoryBloc()),
        BlocProvider(create: (_) => FlightSearchBloc()),
        BlocProvider(
          create: (_) => ProfileBloc()
            ..add(
              user != null
                  ? UpdateProfile(
                      name: '${user.lastName} ${user.firstName}',
                      email: user.email,
                      phone: user.phone,
                      birth: user.birthDay ?? '',
                      gender: user.gender ?? '',
                      country: user.country ?? '',
                      address: user.address ?? '',
                      countryCode: user.countryCode ?? '',
                    )
                  : LoadProfileFromFirestore(),
            ),
        ),
        BlocProvider(create: (_) => BookingsBloc()),
        BlocProvider(create: (_) => SearchDateBloc()),
        BlocProvider(create: (_) => FlightDateBloc()),
        BlocProvider(create: (_) => SelectPassengerBloc()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    // tạo router 1 lần
    final router = buildRouter(initialLocation: isLoggedIn ? '/' : '/login');

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, localeState) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,

          // 1. Inject locale từ bloc
          locale: localeState.locale,

          // 2. Các locale được generate từ ARB
          supportedLocales: AppLocalizations.supportedLocales,

          // 3. Delegate để Flutter biết cách load các bản dịch
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          builder: (context, child) {
            final locale = Localizations.localeOf(context);

            return BlocBuilder<BottomNavBloc, BottomNavState>(
              builder: (context, navState) {
                return Scaffold(
                  key: ValueKey(locale.languageCode),
                  body: child,
                );
              },
            );
          },
        );
      },
    );
  }
}
