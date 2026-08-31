import 'package:flutter/material.dart';
import 'package:task_manager/screens/cancel_task_screen.dart';
import 'package:task_manager/screens/completed_task_screen.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/screens/progress_task_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {

  int selectedIndex = 0;

  List screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:NetworkImage('https://scontent.fdac177-2.fna.fbcdn.net/v/t39.30808-6/776640727_1607274110991784_7110676742696664943_n.jpg?stp=dst-jpg_tt6&cstp=mx960x960&ctp=s960x960&_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=JxHILUxy_-AQ7kNvwH54OZ-&_nc_oc=Adq8NsfaiU8wdX-ZuY88SMQCNh2BiXWbqM-loP2hwiNhESa29xL4MsBRG-5K9MSLnis&_nc_zt=23&_nc_ht=scontent.fdac177-2.fna&_nc_gid=tjqtXvZ472jrR9XnBnttxQ&_nc_ss=7b2a8&oh=00_AQKSmOjPCCgEqMrstGfvaP1BKas5FcRv1-QIaKTBEKlwCw&oe=6A9BADF0'),
            )
          ],
        ),
      ),

      body:screens[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
          indicatorColor: Colors.green,
          onDestinationSelected: (int index){
            selectedIndex = index;
            setState(() {
            });
          },


          destinations: [
        NavigationDestination(icon: Icon(Icons.add_task), label: 'New'),
        NavigationDestination(icon: Icon(Icons.task), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.task_alt), label: 'Completed'),
        NavigationDestination(icon: Icon(Icons.cancel), label: 'Canceled'),
      ]),
    );
  }
}
