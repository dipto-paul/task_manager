import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Text Title',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 18,
        ),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('data'),
            SizedBox(height: 5,),
            Text('Date: 20/10/2025'),

            Row(
              children: [
                Chip(label: Text('New',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.blue,
                ),

                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.orange,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}