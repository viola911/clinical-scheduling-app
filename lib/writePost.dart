import 'package:flutter/material.dart';
import 'package:scheduling_app/callscreen.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/homescreen.dart';
import 'package:scheduling_app/model/model.dart';
import 'package:scheduling_app/model/posts.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Mind Khan',
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: kSecondaryColor),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 8, 100, 118)),
              child: Text(
                'Options',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomescreenAdmin()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
              ),
              title: const Text('Write Post'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
