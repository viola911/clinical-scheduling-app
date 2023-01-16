import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/constants.dart';
import '../screens/homescreen.dart';

const Color black = Color(0xFF000000);

class signinAdmin extends StatelessWidget {
  const signinAdmin({super.key});

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
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
              context.go('/AdminScreen');
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
