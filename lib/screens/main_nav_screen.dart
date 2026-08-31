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
              radius: 22,
              backgroundImage: NetworkImage('https://scontent.fdac177-2.fna.fbcdn.net/v/t39.30808-1/776640727_1607274110991784_7110676742696664943_n.jpg?stp=dst-jpg_tt6&cstp=mx960x960&ctp=s480x480&_nc_cat=105&ccb=1-7&_nc_sid=e99d92&_nc_ohc=JxHILUxy_-AQ7kNvwFPAlJF&_nc_oc=AdpNF4k1Znlr4zkvNausP72hFH7jXllq_ivV3VXr3Dn0vbkXfHA620pUgsDxvyvIPgA&_nc_zt=24&_nc_ht=scontent.fdac177-2.fna&_nc_gid=Zf76fkEOOBS3I41fdGKBbw&_nc_ss=7b2a8&oh=00_AQI68VvPFZ5Gh_e6tZInl3XYxRKJnD5iRaHgMhtsyP4OXg&oe=6A9B966E'),
              onBackgroundImageError: (exception, stackTrace) {
                print("Image load error: $exception");
              },
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dipto Paul", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
                Text("diptopaul.contact@gmail.com", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),)
              ],
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
