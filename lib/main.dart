import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/home/home_bloc.dart';
import 'package:heyyo_trip/blocs/home/home_state.dart';
import 'package:heyyo_trip/screens/login_screens.dart';
import 'package:heyyo_trip/config/router.dart';
import 'package:heyyo_trip/config/theme.dart';
import 'package:heyyo_trip/common/widget/section.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => CategoryBloc())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override   
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
