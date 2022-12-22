import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/editprofileUSER.dart';
import 'package:scheduling_app/homescreen.dart';
import 'package:scheduling_app/signinpageADMIN.dart';
import 'package:scheduling_app/signinpageUSER.dart';
import 'package:scheduling_app/userHome.dart';
import 'package:go_router/go_router.dart';
import 'model/routes.dart';

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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(" ",
                            style: TextStyle(
                                fontSize: 50,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(" ",
                          style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 5, 79, 102),
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(69, 224, 150, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            wordSpacing: 4.0,
                            height: 1.5),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              elevation: 2,
                              backgroundColor: Colors.blueGrey),
                          onPressed: () => context.go('/AdminScreen'),
                          child: const Text("Admin"),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              elevation: 2,
                              backgroundColor: Colors.blueGrey),
                          onPressed: () => context.go('/UserScreen'),
                          child: const Text("User"),
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
