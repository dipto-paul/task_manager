import 'package:flutter/material.dart';

import '../widgets/task_card.dart';


class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
                itemBuilder: (context, index){
                  return TaskCard(title: 'New', count: 25,);
                },
              separatorBuilder: (BuildContext context, int index){
                return SizedBox(width: 5,);
              },
            )
          )
        ],
      )
    );
  }
}


