import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/Payment.dart';
import 'package:scheduling_app/screens/YourAppointments.dart';
import 'package:scheduling_app/main.dart';
import 'package:scheduling_app/screens/userHome.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:scheduling_app/screens/thankupage.dart';
import 'package:scheduling_app/services/constants.dart';

class sched extends StatefulWidget {
  @override
  State<sched> createState() => _schedState();
}

class _schedState extends State<sched> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedules Availble"),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          DateFormat.MMMM().format(DateTime.now()),
                        ),
                        Text(
                          DateFormat.d().format(DateTime.now()),
                        ),
                        Text(
                          DateFormat.EEEE().format(DateTime.now()),
                        ),
                      ],
                    ),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 60)),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 255, 255, 2555),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: Time_Slot.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Card(
                          color: selectedIndex == index
                              ? const Color.fromARGB(255, 235, 245, 235)
                              : null,
                          child: GridTile(
                            header: selectedIndex == index
                                ? const Icon(Icons.check)
                                : null,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Time_Slot.elementAt(index)),
                                  const Text("Available")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            buttonPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(100, 50),
                    foregroundColor: Colors.black,
                    elevation: 2,
                    backgroundColor: kPrimaryColor),
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homescreen(),
                    ),
                  );
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(100, 50),
                    foregroundColor: Colors.black,
                    elevation: 2,
                    backgroundColor: kPrimaryColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                },
                child: const Text("Reserve"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const Time_Slot = {
  '4:00-5:00',
  '5:00-6:00',
  '6:00-7:00',
  '7:00-8:00',
  '8:00-9:00',
  '9:00-10:00'
};
int? selectedIndex;
