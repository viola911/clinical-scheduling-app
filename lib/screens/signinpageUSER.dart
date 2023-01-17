import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/constants.dart';

const Color black = Color(0xFF000000);

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isvisible = true;

  final username = TextEditingController();
  final password = TextEditingController();

  bool usernamevalidate = false;
  bool passwordvalidate = false;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Welcome"),
            centerTitle: true,
            backgroundColor: kSecondaryColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  errorText: usernamevalidate ? 'Value Can not Be Empty' : null,
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
                  hintText: ' Username',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                controller: password,
                obscureText: _isvisible,
                decoration: InputDecoration(
                  errorText: passwordvalidate ? 'Value Can not Be Empty' : null,
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isvisible = !_isvisible;
                        });
                      },
                      icon: _isvisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  border: const OutlineInputBorder(),
                  hintText: ' Password',
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
                if (username.text.isEmpty) {
                  setState(() {
                    username.text.isEmpty
                        ? usernamevalidate = true
                        : usernamevalidate = false;
                  });
                } else if (password.text.isEmpty) {
                  setState(() {
                    password.text.isEmpty
                        ? passwordvalidate = true
                        : passwordvalidate = false;
                  });
                } else {
                  context.go('/UserScreen');
                }
              },
              child: const Text('Sign In'),
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
                //context.go('/UserScreen');
              },
              child: const Text('Forget Password'),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account'),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        elevation: 2,
                        backgroundColor: kPrimaryColor),
                    onPressed: () {
                      context.go('/signup');
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
