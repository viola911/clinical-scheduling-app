// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/constants.dart';

const Color black = Color(0xFF000000);

class signinAdmin extends StatefulWidget {
  const signinAdmin({super.key});

  @override
  State<signinAdmin> createState() => _signinAdminState();
}

class _signinAdminState extends State<signinAdmin> {
  int adminid = 1234;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Welcome "),
          centerTitle: true,
          backgroundColor: kSecondaryColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please Enter you ID!'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: TextField(
              onChanged: (value) {
                adminid = int.parse(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: ' ID',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                elevation: 2,
                backgroundColor: kPrimaryColor),
            onPressed: () {
              if (adminid == 1234) {
                context.go('/AdminScreen');
              } else {
                context.go('/wrongid');
              }
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
