import 'package:flutter/material.dart';





class editProfileAdmin extends StatefulWidget {
  const editProfileAdmin({Key? key}) : super(key: key);

  @override
  _editProfileAdminState createState() => _editProfileAdminState();
}

class _editProfileAdminState extends State<editProfileAdmin> {
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
                              onPressed:_trySubmitForm,
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
