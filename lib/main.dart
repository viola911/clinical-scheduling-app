import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:scheduling_app/providers/google_sign_in.dart';
import 'firebase_options.dart';
import 'package:scheduling_app/screens/Schedules.dart';
import 'package:scheduling_app/screens/YourAppointments.dart';
import 'package:scheduling_app/screens/editprofileUSER.dart';
import 'package:scheduling_app/screens/intro.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduling_app/screens/signinpageUSER.dart';
import 'package:scheduling_app/screens/signuppageUSER.dart';
import 'package:scheduling_app/screens/wrongID.dart';
import 'package:scheduling_app/services/constants.dart';
import 'screens/Payment.dart';
import 'screens/editprofieAdmin.dart';
import 'screens/homescreen.dart';
import 'screens/signinpageADMIN.dart';
import 'screens/userHome.dart';
import 'screens/writePost.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mind Khan',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF283c50),
            ),
          ),
          routeInformationParser: _route.routeInformationParser,
          routerDelegate: _route.routerDelegate,
        ));
  }
}

final GoRouter _route = GoRouter(routes: <GoRoute>[
  GoRoute(
    routes: <GoRoute>[
      GoRoute(
        path: 'wrongid',
        builder: (BuildContext context, GoRouterState state) => const wrongid(),
      ),
      GoRoute(
        path: 'UserScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const Homescreen(),
      ),
      GoRoute(
        path: 'editprof',
        builder: (BuildContext context, GoRouterState state) =>
            const EditprofUser(),
      ),
      GoRoute(
        path: 'sched',
        builder: (BuildContext context, GoRouterState state) => sched(),
      ),
      GoRoute(
        path: 'logout',
        builder: (BuildContext context, GoRouterState state) =>
            const IntroScreen(),
      ),
      GoRoute(
        path: 'EditProfAdmin',
        builder: (BuildContext context, GoRouterState state) =>
            const editProfileAdmin(),
      ),
      GoRoute(
        path: 'EditProfUser',
        builder: (BuildContext context, GoRouterState state) =>
            const EditprofUser(),
      ),
      GoRoute(
        path: 'AdminScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const HomescreenAdmin(),
      ),
      GoRoute(
        path: 'Payment',
        builder: (BuildContext context, GoRouterState state) => const Payment(),
      ),
      GoRoute(
        path: 'SignInAdmin',
        builder: (BuildContext context, GoRouterState state) =>
            const signinAdmin(),
      ),
      GoRoute(
        path: 'Appointments',
        builder: (BuildContext context, GoRouterState state) =>
            LoadMoreWidget(),
      ),
      GoRoute(
        path: "post",
        builder: (BuildContext context, GoRouterState state) => const Post(),
      ),
      GoRoute(path: 'signinUser', builder: (context, state) => const Signin()),
      GoRoute(path: 'signup', builder: (context, state) => const SignUp()),
    ],
    path: '/',
    builder: (BuildContext context, GoRouterState state) => const IntroScreen(),
  )
]);
