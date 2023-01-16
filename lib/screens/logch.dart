import 'package:flutter/material.dart';
import 'package:scheduling_app/services/constants.dart';
import 'package:scheduling_app/screens/editprofileUSER.dart';
import 'package:scheduling_app/screens/homescreen.dart';
import 'package:scheduling_app/screens/signinpageADMIN.dart';
import 'package:scheduling_app/screens/signinpageUSER.dart';
import 'package:scheduling_app/screens/userHome.dart';
import 'package:go_router/go_router.dart';
import '../services/routes.dart';

const Color black = Color(0xFF000000);

class Logch extends StatefulWidget {
  const Logch({super.key});

  @override
  State<Logch> createState() => _LogchState();
}

class _LogchState extends State<Logch> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const Color black = Color(0xFF000000);

    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/logo.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      height: 25,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: const Size(100, 50),
                              foregroundColor: Color.fromARGB(255, 13, 2, 10),
                              elevation: 2,
                              backgroundColor: Colors.lightBlue[200]),
                          onPressed: () => context.go('/AdminScreen'),
                          child: const Text("Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Anisette',
                              )),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: const Size(100, 50),
                              foregroundColor: Color.fromARGB(255, 13, 2, 10),
                              elevation: 2,
                              backgroundColor: Colors.lightBlue[200]),
                          onPressed: () => context.go('/UserScreen'),
                          child: const Text(" Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Anisette',
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
