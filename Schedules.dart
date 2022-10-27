
import 'package:flutter/material.dart';
import 'package:mobile_project/Payment.dart';
import 'package:mobile_project/data.dart';
import 'package:mobile_project/YourAppointments.dart';


class Schedule extends StatefulWidget {
  const Schedule({super.key, required this.title});

  

  final String title;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      
      appBar: AppBar( 
        
        
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Schedules Availble"),
        centerTitle: true,
        
        


      ),
    drawer:
      Container( width: 200,
        child: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          
          child: Text('Your Account'),
      
      
        ),
        ListTile(
          title: const Text('Account'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Schedule Appointment'),
          onTap: () {Navigator.push(
  
                               context,
  
                       MaterialPageRoute(builder: (context) =>  Schedule(title: '',),),
  
                              );
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Your Appointment'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Log Out'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      
          ],
        ),
      ),
      ),



        


      

      body: ListView(
        children: [
          SizedBox(
            width: 200.0,
            height: 150.0,
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: 300,
                  color: Color.fromARGB(156, 23, 23, 183),
                   alignment: Alignment.center,
                   child: Text("test"),
                   ),
              ),
              SizedBox(
                width: 10.0,
            
               ),
                 
                 TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                 },
                  child: Text("Reserve"),
                  style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: Colors.blueGrey),
                  )
                 
                 
                 ],
                  ),
                   ColoredBox(color: Color.fromARGB(167, 55, 130, 243),
                   child: SizedBox(
                     height: 10.0,
                     width: 300,
                     
                     
                    ),),
         Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: 300,
                  color: Color.fromARGB(156, 23, 23, 183),
                   alignment: Alignment.center,
                   child: Text("test"),
                   ),
              ),
              SizedBox(
                width: 10.0,
            
               ),
                 
                 TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                 },
                  child: Text("Reserve"),
                  style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  elevation: 2,
                  backgroundColor: Colors.blueGrey),
                  )
                 
                 
                 ],
                  ),
         
        

ButtonBar(
  
                alignment: MainAxisAlignment.center,
  
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
  
                       MaterialPageRoute(builder: (context) =>  Schedule(title: '',),),
  
                              );},
  
                  ),
  
                  
  
                ],
  
              ),

        ],



      ),
      
      
      
      


    );
  }
}  
