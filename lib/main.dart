import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/modules/homepage/bookings/blocs/bookings_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/modules/homepage/home/blocs/home_state.dart';
import 'package:heyyo_trip/config/router.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'package:heyyo_trip/modules/hotel/search/blocs/search_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final uid = prefs.getString('uid');
  final email = prefs.getString('email') ?? '';
  final firstName = prefs.getString('firstName') ?? '';
  final lastName = prefs.getString('lastName') ?? '';
  final phone = prefs.getString('phone') ?? '';

  final bool isLoggedIn =
      FirebaseAuth.instance.currentUser != null && uid != null;

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    profileInfo: {
      'name': '$lastName $firstName',
      'email': email,
      'phone': phone,
    },
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final Map<String, String> profileInfo;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.profileInfo,
  });

  @override
  Widget build(BuildContext context) {
    final router = buildRouter(initialLocation: isLoggedIn ? '/' : '/login');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(
          create: (context) => ProfileBloc()..add(LoadProfileFromFirestore()),
        ),
        BlocProvider(create: (context) => BookingsBloc()),
        BlocProvider(create: (context) => SearchDateBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
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
