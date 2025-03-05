import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/screens/login_screens.dart';
import 'package:heyyo_trip/screens/home_screens.dart';


final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen()
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen()
    )
  ]
);