import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/editprofieAdmin.dart';
import 'package:scheduling_app/model/model.dart';
import 'package:scheduling_app/model/posts.dart';
import 'package:scheduling_app/writePost.dart';
import 'package:table_calendar/table_calendar.dart';

import 'callscreen.dart';

class Homescreen2 extends StatefulWidget {
  const Homescreen2({super.key});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
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
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Homescreen2()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.post_add,
              ),
              title: const Text('Write Post'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Post()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
              ),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
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
                          color: kPrimaryColor,
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
                          "Dr.Hadyi",
                          style:
                              TextStyle(fontSize: 35, color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //data section
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2022),
                lastDay: DateTime(2023),
                calendarFormat: CalendarFormat.week,
                daysOfWeekVisible: true,
                headerVisible: true,
                calendarStyle: CalendarStyle(
                  weekendDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  defaultDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kSecondaryColor),
                  ),
                  todayTextStyle:
                      const TextStyle(fontSize: 20, fontFamily: 'Oswald'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var patientsCard = PatientsCard(
                      product: products[index],
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Callscreen(product: products[index])));
                      },
                    );
                    return patientsCard;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientsCard extends StatelessWidget {
  const PatientsCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          InkWell(
            onTap: press,
            child: Row(
              children: [
                Text(product.time),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(product.image, fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(product.icon)
        ],
      ),
    );
  }
}
