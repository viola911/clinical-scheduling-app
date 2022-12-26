// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_project/constants.dart';
import 'package:mobile_project/editprofileUSER.dart';
import 'package:mobile_project/homescreen.dart';
import 'package:mobile_project/logch.dart';
import 'package:mobile_project/signinpageADMIN.dart';
import 'package:mobile_project/signinpageUSER.dart';
import 'package:mobile_project/userHome.dart';

const Color black = Color(0xFF000000);

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const Color black = Color(0xFF000000);
    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      height: 281,
                    ),
                    SizedBox(
                      height: animation.value,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        " An easier way to reach your psychitrist ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(69, 224, 150, 1),
                            fontFamily: 'Oswald',
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            wordSpacing: 4.0,
                            height: animation.value / 100),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                       context.go('/logch');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Color.fromRGBO(1, 3, 251, 1),
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 50,
                            color: Color.fromRGBO(1, 3, 251, 1),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
  }
}