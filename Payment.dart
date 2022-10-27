

import 'package:mobile_project/main.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/thankupage.dart';



class Payment extends StatefulWidget{
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
   
Widget build(BuildContext context){
return Scaffold(
appBar: AppBar(
title: Text("Payment"),
centerTitle: true,

),


body: ListView(
  children: [
    Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
  Text("Card Name:"),
  SizedBox(width: 35),

  Expanded(
    child: SizedBox(width: 150,
      child: TextFormField(
      decoration:  InputDecoration(
       
        
        
      ),
    ),
    ),
  ),
  
],

    ),
    Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
 
  Text("Card Number:"),
  SizedBox(width: 20,),
  

  Expanded(
    child: SizedBox(width: 150,
    
      child: TextFormField(
      decoration:  InputDecoration(
        hintText: "1234 xxxx xxxx xxxx",
       
        
        
      ),
    ),
    ),
  ),
],

    ),
    Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
  Text("CVV:"),
  Expanded(child: SizedBox(width: 200,)),
  Expanded(child: Text("Date:")),
  
],

    ),
Row(mainAxisAlignment: MainAxisAlignment.center,
children: [
  Expanded(
    child: SizedBox(width: 100,
      child: TextFormField(
      decoration:  InputDecoration(
        hintText: "1xx",
      ),
    ),
    ),
  ),
SizedBox(width: 50,),

  Expanded(
    child: SizedBox(width: 100,
      child: TextFormField(
      decoration:  InputDecoration(
        hintText: "DD/MM",
      ),
    ),
    ),
  ),


],
),


    ButtonBar(
  
                alignment: MainAxisAlignment.end,
  
                buttonPadding:EdgeInsets.symmetric(
  
                     horizontal: 30,
                ),
  
                children: [
                  TextButton(
  
                    child: Text("Cancel"),
  
                    style: TextButton.styleFrom(
  
                    foregroundColor: Colors.black,
  
                    elevation: 2,
  
                    backgroundColor: Colors.blueGrey),
  
                    onPressed: (){Navigator.push(
  
                               context,
  
                       MaterialPageRoute(builder: (context) =>  MyHomePage(title: '',),),
  
                              );},
  
                  ),
  
                  TextButton(
  
                    child: Text("Subit"),
  
                    style: TextButton.styleFrom(
  
                    foregroundColor: Colors.black,
  
                    elevation: 2,
  
                    backgroundColor: Colors.blueGrey),
  
                    onPressed: (){Navigator.push(
  
                               context,
  
                       MaterialPageRoute(builder: (context) =>  ThankYouPage(title: 'maged',)),
  
                              );
  
                              },
  
                  ),
  
                ],
  
              ),
],

 

),
          
  
  
  
  
  
    
  
    


  

);

}
}

