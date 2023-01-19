// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:scheduling_app/providers/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/constants.dart';

const Color black = Color(0xFF000000);

class signinAdmin extends StatefulWidget {
  const signinAdmin({super.key});

  @override
  State<signinAdmin> createState() => _signinAdminState();
}

class _signinAdminState extends State<signinAdmin> {
  @override
  int adminid = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Login "),
          centerTitle: true,
          backgroundColor: kSecondaryColor),
      body: SizedBox(
        height: 900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter your ID !',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Anisette',
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: TextField(
                cursorColor: Colors.lightBlue[200],
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Anisette',
                ),
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
              height: 200,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: Colors.lightBlue[200]),
              onPressed: () {
                if (adminid == 1234) {
                  context.go('/AdminScreen');
                }
                // ignore: unrelated_type_equality_checks
                else if (adminid == Null) {
                  context.go('/wrongid');
                } else {
                  context.go('/wrongid');
                }
              },
              child: const Text('Sign In',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Anisette',
                  )),
            ),
            Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[200],
                  minimumSize: Size(double.infinity, 50)),
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
              label: const Text('Sign in with Google'),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
