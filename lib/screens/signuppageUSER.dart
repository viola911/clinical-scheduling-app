import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/constants.dart';

const Color black = Color(0xFF000000);

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isvisible = true;
  bool _isPasswordiseightcharachters = false;

  onPasswordchanged(password) {
    setState(() {
      if (password.length >= 8) {
        _isPasswordiseightcharachters = true;
      } else {
        _isPasswordiseightcharachters = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Create your account"),
            centerTitle: true,
            backgroundColor: kSecondaryColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                  hintText: ' First Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(),
                  hintText: ' Last Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Create a UserName',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                onChanged: (password) => onPasswordchanged(password),
                obscureText: _isvisible,
                decoration: InputDecoration(
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
                  hintText: 'Set a Password',
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  const Text('Contains at least 8 characters'),
                  const SizedBox(
                    width: 10,
                  ),
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: _isPasswordiseightcharachters
                            ? Colors.green
                            : Colors.transparent,
                        border: _isPasswordiseightcharachters
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: kPrimaryColor),
              onPressed: () {
                context.go('/signinUser');
              },
              child: const Text('Sign In'),
            ),
          ],
        ));
  }
}
