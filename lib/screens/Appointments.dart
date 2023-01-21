import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduling_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


class Appointments extends StatefulWidget {
  @override
  State<Appointments> createState() => _Appointments();
}

class _Appointments extends State<Appointments> {


  @override

  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Schedules "),
        centerTitle: true,
        backgroundColor: kSecondaryColor,
      ),
      body: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Appointments')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 5,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10.0,
                        children: snapshot.data!.docs.map((Appointments) {
                          return ListView(
                            children:[
                                Text('$snapshot.data'),
                        ] );
                        }).toList(),
                      );
                    },
                   )               );
  }
}
