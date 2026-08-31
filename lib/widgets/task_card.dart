import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final int count;
  const TaskCard({
    super.key, required this.title, required this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString(), style: Theme.of(context).textTheme.titleLarge,),
        Text(title),
      ],
    );
  }
}