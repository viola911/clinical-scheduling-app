import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindKhan.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _ID = '';
  String _confirmID = '';

  // This function is triggered when the user press the "confirm ID" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_ID);
      debugPrint(_confirmID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'ID'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.length > 4 && value.length < 4) {
                            return 'ID should be 4 numbera in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _ID = value,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Confirm ID'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          if (value != _ID) {
                            return 'Confimation ID does not match the entered ID';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmID = value,
                      ),
                      const SizedBox(height: 40),
                      Container(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              onPressed: _trySubmitForm,
                              child: const Text('Save Changes')))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
