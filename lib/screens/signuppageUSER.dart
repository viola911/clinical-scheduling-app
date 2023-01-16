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

  final fname = TextEditingController();
  final lname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final password8 = TextEditingController();

  bool fnamevalidate = false;
  bool lnamevalidate = false;
  bool usernamevalidate = false;
  bool passwordvalidate = false;

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                controller: fname,
                decoration: InputDecoration(
                  errorText: fnamevalidate ? 'Value Can not Be Empty' : null,
                  prefixIcon: const Icon(Icons.abc),
                  border: const OutlineInputBorder(),
                  hintText: ' First Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                obscureText: false,
                controller: lname,
                decoration: InputDecoration(
                  errorText: lnamevalidate ? 'Value Can not Be Empty' : null,
                  prefixIcon: const Icon(Icons.abc),
                  border: const OutlineInputBorder(),
                  hintText: ' Last Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: TextField(
                obscureText: false,
                controller: username,
                decoration: InputDecoration(
                  errorText: usernamevalidate ? 'Value Can not Be Empty' : null,
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
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
                controller: password,
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
                if (fname.text.isEmpty) {
                  setState(() {
                    fname.text.isEmpty
                        ? fnamevalidate = true
                        : fnamevalidate = false;
                  });
                } else if (lname.text.isEmpty) {
                  setState(() {
                    lname.text.isEmpty
                        ? lnamevalidate = true
                        : lnamevalidate = false;
                  });
                } else if (username.text.isEmpty) {
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
                } else if (password.text.length < 8) {
                  setState(() {
                    _isPasswordiseightcharachters = false;
                  });
                } else {
                  context.go('/signinUser');
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ));
  }
}
