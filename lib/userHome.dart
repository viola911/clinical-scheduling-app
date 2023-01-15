import 'package:flutter/material.dart';
import 'package:scheduling_app/Schedules.dart';
import 'package:scheduling_app/YourAppointments.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/editprofileUSER.dart';
import 'package:scheduling_app/intro.dart';
import 'package:scheduling_app/main.dart';
import 'package:scheduling_app/model/model.dart';

import 'package:scheduling_app/writePost.dart';
import 'package:table_calendar/table_calendar.dart';

import 'callscreen.dart';
import 'package:go_router/go_router.dart';
import 'model/routes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
                    color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () => context.go('/UserScreen'),
            ),
            ListTile(
              leading: const Icon(
                Icons.post_add,
              ),
              title: const Text('Schedule Appointment'),
              onTap: () {
                context.push("/sched");
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.post_add,
              ),
              title: const Text('Your Appointment'),
              onTap: () => context.push('/Appointments'),
            ),
            ListTile(
              leading: const Icon(
                Icons.book_online,
              ),
              title: const Text('Posts'),
              onTap: () => context.push('/post'),
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
              ),
              title: const Text('Edit Profile'),
              onTap: () => context.push("/editprof"),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () => context.go("/logout"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/images/images.png")),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: kSecondaryColor,
                        ),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Good Morning ",
                          style: TextStyle(
                              fontSize: 35,
                              color: kSecondaryColor,
                              fontFamily: 'Oswald'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Maged",
                          style:
                              TextStyle(fontSize: 35, color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
