import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/model/model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'callscreen.dart';

class HomescreenAdmin extends StatefulWidget {
  const HomescreenAdmin({super.key});

  @override
  State<HomescreenAdmin> createState() => _HomescreenAdminState();
}

class _HomescreenAdminState extends State<HomescreenAdmin> {
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
              decoration: BoxDecoration(
                color: kSecondaryColor,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                    fontSize: 25, color: Colors.white, fontFamily: 'Anisette'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () => context.go('/homeAdmin'),
            ),
            ListTile(
              leading: const Icon(
                Icons.post_add,
              ),
              title: const Text('Write Post'),
              onTap: () => context.push('/post'),
            ),
            ListTile(
              leading: const Icon(
                Icons.edit,
              ),
              title: const Text('Edit Profile'),
              onTap: () => context.push('/editProfileAdmin'),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () => context.go('/logout'),
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
                              fontFamily: 'Anisette'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Dr.Hadyi",
                          style: TextStyle(
                              fontSize: 35,
                              color: kSecondaryColor,
                              fontFamily: 'Anisette'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //data section
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2023),
                lastDay: DateTime(2024),
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
                  todayTextStyle: const TextStyle(
                    fontSize: 20,
                  ),
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

class PatientsCard extends StatefulWidget {
  const PatientsCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final void Function() press;

  @override
  State<PatientsCard> createState() => _PatientsCardState();
}

class _PatientsCardState extends State<PatientsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          InkWell(
            onTap: widget.press,
            child: Row(
              children: [
                Text(widget.product.time),
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
                      child:
                          Image.asset(widget.product.image, fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
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
          IconButton(icon: Icon(widget.product.icon), onPressed: () {})
        ],
      ),
    );
  }
}
