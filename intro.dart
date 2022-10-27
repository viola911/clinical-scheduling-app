// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/homescreen.dart';

const Color black = Color(0xFF000000);

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
              image: AssetImage("assets/images/mental.jpg"), fit: BoxFit.cover),
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(" Mind Khan",
                            style: TextStyle(
                                fontSize: 50,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Mental Health Care",
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 5, 79, 102),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        " This application provides an easier way to reach to your Psychitrist ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 54, 72),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            wordSpacing: 4.0,
                            height: 1.5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homescreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 50,
                            color: kSecondaryColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(flex: 3, child: Text('test'))
          ],
        ),
      ),
    ));
  }
}
