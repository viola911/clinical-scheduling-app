
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_project/Payment.dart';
import 'package:mobile_project/YourAppointments.dart';
import 'package:mobile_project/main.dart';
import 'package:mobile_project/userHome.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mobile_project/thankupage.dart';
import 'package:mobile_project/constants.dart';





 class sched extends StatefulWidget {
 


  @override
  State<sched> createState() => _schedState();
}
 class _schedState extends State<sched> {
DateTime selectedDate = DateTime.now();

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
          Expanded(child: 
          Center(child: Padding(padding: const EdgeInsets.all(12),
          child: Column(children: [
            Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
            
            
            
              
          ],),),))
        ,
        GestureDetector(onTap: (){_selectDate(context);
       
     

        },child: const Padding(
          padding: EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.calendar_today,color: Color.fromARGB(255, 255, 255, 2555),),
          ),),)
        ],
      ),
    )
 ,
 Expanded(child: GridView.builder( 
  itemCount: Time_Slot.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  
  itemBuilder: (context, index) => GestureDetector(
    onTap: () {
     setState(() {
       selectedIndex=index ;
     });
     
     
     
    },
    child: Card(
                color: selectedIndex == index? const Color.fromARGB(255, 235, 245, 235) : null,

    child: GridTile(
      header:   selectedIndex==   index ?  const Icon(Icons.check):null,
      child:Center(
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
  )
  
  )),
  ButtonBar(
  
                alignment: MainAxisAlignment.spaceBetween,
  
                buttonPadding:const EdgeInsets.symmetric(
  
                     horizontal: 30,
                ),
  
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    elevation: 2,
                    backgroundColor: kPrimaryColor),
                    onPressed: ()=> context.go('/UserScreen'),
                    child: const Text("Cancel"),
                  ),
  
                  TextButton(
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    elevation: 2,
                    backgroundColor: kPrimaryColor),
                    onPressed: ( ){
                      if (selectedIndex!=null){
                      context.push('/Payment');}}
                              ,
                    child: const Text("Reserve"),
                  ),
  
                ],
  
              ), ],
  
),


);



  }
   _selectDate (BuildContext context) async {
    final DateTime? selected = await showDatePicker(context: context,
         initialDate: selectedDate,
          firstDate: DateTime.now(),
           lastDate: DateTime.now().add(const Duration(days: 180) ),
           cancelText: "NOT NOW",
           confirmText: "CHOOSE",
           errorFormatText: "Enter a Valid Date",
           errorInvalidText: "Date Out of Range",
          
            );
            if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
       });}

  
  }
  
  const Time_Slot={
    '4:00-5:00',
    '5:00-6:00',
    '6:00-7:00',
    '7:00-8:00',
    '8:00-9:00',
    '9:00-10:00'

  };
  int ?selectedIndex=null;
