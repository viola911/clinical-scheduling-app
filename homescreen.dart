import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/model/model.dart';
import 'package:table_calendar/table_calendar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
                      press: () {},
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
