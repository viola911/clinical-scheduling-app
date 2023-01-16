import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: camel_case_types
class wrongid extends StatelessWidget {
  const wrongid({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Wrong ID'),
        icon: const Icon(Icons.error),
        content: const Text('Please enter the correct ID'),
        actions: [TextButton(onPressed: context.pop, child: const Text('OK'))]);
  }
}
