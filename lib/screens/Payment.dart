import 'package:scheduling_app/screens/Schedules.dart';
import 'package:scheduling_app/main.dart';
import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/thankupage.dart';
import 'package:scheduling_app/services/constants.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Payment"),
          centerTitle: true,
          backgroundColor: kSecondaryColor),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Card Name:"),
              const SizedBox(width: 35),
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: TextFormField(
                    decoration: const InputDecoration(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: const [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Card Number:"),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "1234 xxxx xxxx xxxx",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text("CVV:"),
              Expanded(
                  child: SizedBox(
                width: 200,
              )),
              Expanded(child: Text("Date:")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "1xx",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "DD/MM",
                    ),
                  ),
                ),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
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
                    MaterialPageRoute(builder: (context) => const Payment()),
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
                    MaterialPageRoute(
                        builder: (context) => const ThankYouPage(
                              title: 'maged',
                            )),
                  );
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

