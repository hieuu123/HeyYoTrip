import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/common/shared_prefs/user_model.dart';
import 'package:heyyo_trip/modules/flight/search/blocs/flight_search_bloc.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/config/router.dart';
import 'package:heyyo_trip/modules/homepage/language/blocs/language_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final user = await PreferencesManager.getUser();
  final isLoggedIn = FirebaseAuth.instance.currentUser != null && user != null;

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp(isLoggedIn: isLoggedIn, user: user),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final UserModel? user;

  const MyApp({super.key, required this.isLoggedIn, required this.user});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter(initialLocation: isLoggedIn ? '/' : '/login');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => FlightSearchBloc()),
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(
          create: (context) => ProfileBloc()
            ..add(
              user != null
                  ? UpdateProfile(
                      name: '${user!.lastName} ${user!.firstName}',
                      email: user!.email,
                      phone: user!.phone,
                      birth: user?.birthDay ?? '',
                      gender: user?.gender ?? '',
                      country: user?.country ?? '',
                      address: user?.address ?? '',
                      countryCode: user?.countryCode ?? '',
                    )
                  : LoadProfileFromFirestore(),
            ),
        ),
        BlocProvider(create: (context) => BookingsBloc()),
        BlocProvider(create: (context) => SearchDateBloc()),
        BlocProvider(create: (context) => FlightDateBloc()),
        BlocProvider(create: (context) => SelectPassengerBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        builder: (context, child) {
          return Material(
            child: BlocBuilder<BottomNavBloc, BottomNavState>(
              builder: (context, state) {
                return Scaffold(
                  body: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
