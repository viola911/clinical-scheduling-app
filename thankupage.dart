

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_project/Schedules.dart';
import 'package:mobile_project/Payment.dart';
import 'package:mobile_project/YourAppointments.dart';
import 'package:mobile_project/main.dart';
import 'package:mobile_project/userHome.dart';
import "package:mobile_project/constants.dart";
import 'package:go_router/go_router.dart';




class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

Color themeColor = const Color.fromARGB(255, 255, 255, 255);

class _ThankYouPageState extends State<ThankYouPage> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(35),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
             child: Image.asset(
                "assets/Images/check.jpg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Payment done Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(child:TextButton(
  
                    style: TextButton.styleFrom(
  
                    foregroundColor: Colors.black,
  
                    elevation: 2,
  
                    backgroundColor: kSecondaryColor),
  
                     onPressed: ()=>context.go('/UserScreen'),
  
                    child: const Text("Home"),
  
                  ),),
          ],
        ),
      ),
    );
  }
}