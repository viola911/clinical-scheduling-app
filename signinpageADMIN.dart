import 'package:flutter/material.dart';

import 'constants.dart';




// Create a Form widget.
class SignInAdmin extends StatefulWidget {
  const SignInAdmin({super.key});

  @override
  SignInAdminState createState() {
    return SignInAdminState();
  }
}

class SignInAdminState extends State<SignInAdmin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController IdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Enter Your ID!',
                style: TextStyle(fontSize: 20),
              )),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            ),
            // The validator receives the text that the user has entered
            validator: (value) {
              return (value != null && value.contains('1234'))
                  ? 'Signed IN.'
                  : 'Enter a valid ID!';
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                  style: TextButton.styleFrom(
  
                    foregroundColor: Colors.black,
  
                    elevation: 2,
  
                    backgroundColor: kPrimaryColor),

              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot ID screen
            },
            child: const Text(
              'Forgot ID',
            ),
          ),
        ],
      ),
    );
  }
}
