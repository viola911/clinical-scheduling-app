import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                              foregroundColor:
                                  const Color.fromARGB(255, 13, 2, 10),
                              elevation: 2,
                              backgroundColor: Colors.lightBlue[200]),
                          onPressed: () => context.go("/signinAdmin"),
                          child: const Text("Admin",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Anisette',
                              )),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              fixedSize: const Size(100, 50),
                              foregroundColor:
                                  const Color.fromARGB(255, 13, 2, 10),
                              elevation: 2,
                              backgroundColor: Colors.lightBlue[200]),
                          onPressed: () => context.go("/signinUser"),
                          child: const Text("User",
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
