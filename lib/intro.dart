// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/editprofileUSER.dart';
import 'package:scheduling_app/homescreen.dart';
import 'package:scheduling_app/logch.dart';
import 'package:scheduling_app/signinpageADMIN.dart';
import 'package:scheduling_app/signinpageUSER.dart';
import 'package:scheduling_app/userHome.dart';

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
              image: AssetImage("assets/images/pIC.png"), fit: BoxFit.cover),
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
                        " AN EASIER WAY TO REACH YOUR PSYCHIATRIST ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(69, 224, 150, 1),
                            fontFamily: 'Anisette',
                            fontSize: 17,
                            //fontWeight: FontWeight.bold,
                            wordSpacing: 4.0,
                            height: animation.value / 100),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Logch()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "NEXT",
                            style: TextStyle(
                              fontFamily: 'Anisette',
                              color: Color.fromRGBO(1, 3, 251, 1),
                              fontSize: 40,
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
