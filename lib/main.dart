import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/Schedules.dart';
import 'package:scheduling_app/screens/YourAppointments.dart';
import 'package:scheduling_app/screens/editprofileUSER.dart';
import 'package:scheduling_app/screens/intro.dart';
import 'package:scheduling_app/screens/logch.dart';
import 'package:scheduling_app/services/routes.dart';
import 'package:go_router/go_router.dart';

import 'screens/Payment.dart';

import 'screens/editprofieAdmin.dart';
import 'screens/homescreen.dart';
import 'model/posts.dart';
import 'services/routes.dart';
import 'screens/signinpageADMIN.dart';
import 'screens/userHome.dart';
import 'screens/writePost.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mind Khan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _route.routeInformationParser,
      routerDelegate: _route.routerDelegate,
    );
  }
}

final GoRouter _route = GoRouter(routes: <GoRoute>[
  GoRoute(
    routes: <GoRoute>[
      GoRoute(
        path: 'UserScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const Homescreen(),
      ),
      GoRoute(
        path: 'editprof',
        builder: (BuildContext context, GoRouterState state) => EditprofUser(),
      ),
      GoRoute(
        path: 'sched',
        builder: (BuildContext context, GoRouterState state) => sched(),
      ),
      GoRoute(
        path: 'logout',
        builder: (BuildContext context, GoRouterState state) => IntroScreen(),
      ),
      GoRoute(
        path: 'EditProfAdmin',
        builder: (BuildContext context, GoRouterState state) =>
            editProfileAdmin(),
      ),
      GoRoute(
        path: 'EditProfUser',
        builder: (BuildContext context, GoRouterState state) => EditprofUser(),
      ),
      GoRoute(
        path: 'AdminScreen',
        builder: (BuildContext context, GoRouterState state) =>
            HomescreenAdmin(),
      ),
      GoRoute(
        path: 'Payment',
        builder: (BuildContext context, GoRouterState state) => Payment(),
      ),
      GoRoute(
        path: 'SignInAdmin',
        builder: (BuildContext context, GoRouterState state) => SignInAdmin(),
      ),
      GoRoute(
        path: 'Appointments',
        builder: (BuildContext context, GoRouterState state) =>
            LoadMoreWidget(),
      ),
      GoRoute(
        path: "post",
        builder: (BuildContext context, GoRouterState state) => Post(),
      ),
    ],
    path: '/',
    builder: (BuildContext context, GoRouterState state) => const IntroScreen(),
  )
]);
