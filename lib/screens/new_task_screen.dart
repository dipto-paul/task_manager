import 'package:flutter/material.dart';
import 'package:task_manager/models/api_response.dart';
import 'package:task_manager/models/task_status_count_model.dart';
import '../service/api_caller.dart';
import '../widgets/task_card_count.dart';
import '../widgets/task_card.dart';
import '../utils/urls.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
  }
  List<TaskStatusCountModel> taskCountByStatus = [];
  List<TaskStatusCountModel> taskList = [];

  Future<void> getAllTaskCount()async {
    final ApiResponse response = await ApiCaller.getRequest(url: TMUrls.taskStatusCountURL);

    List<TaskStatusCountModel> taskCount = [];

    if(response.isSuccess){
      for(Map<String, dynamic>jsonData in response.responseData['data']){
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text(response.responseData['data']),)));
    }

    setState(() {
      taskCountByStatus = taskCount;
    });
  }

  Future<void> getTask(String status)async {
    final ApiResponse response = await ApiCaller.getRequest(url: TMUrls.taskStatusCountURL);

    List<TaskStatusCountModel> taskCount = [];

    if(response.isSuccess){
      for(Map<String, dynamic>jsonData in response.responseData['data']){
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text(response.responseData['data']),)));
    }

    setState(() {
      taskCountByStatus = taskCount;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          const SizedBox(height: 20),

          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: taskCountByStatus.length,

              itemBuilder: (context, index) {
                return SizedBox(
                  width: 87.5,
                  child: TaskCardCount(
                    title: taskCountByStatus[index].sId.toString(),
                    count: taskCountByStatus[index].sum!.toInt(),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          ),

          Expanded(child: ListView.builder(
            itemCount: 20,
              itemBuilder: (context, index){
                return TaskCard();
              }

          )
          )
        ],
      ),
    );
  }
}
