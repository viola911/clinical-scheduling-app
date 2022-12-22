import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduling_app/Schedules.dart';
import 'package:scheduling_app/editprofieAdmin.dart';
import 'package:scheduling_app/intro.dart';

final GoRouter _route = GoRouter(routes: <GoRoute>[
  GoRoute(
    routes: <GoRoute>[
      GoRoute(
        path: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const editProfileAdmin(),
      ),
    ],
    path: '/',
    builder: (BuildContext context, GoRouterState state) =>
        const editProfileAdmin(),
  )
]);
