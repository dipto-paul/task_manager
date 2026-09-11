import '../models/api_response.dart';
import '../models/task_model.dart';
import '../models/task_status_count_model.dart';
import '../service/api_caller.dart';
import '../utils/urls.dart';
import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_card_count.dart';
import 'add_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  bool isLoading = true;

  List<TaskStatusCountModel> taskCountByStatus = [];
  List<TaskModel> taskList = [];

  @override
  void initState() {
    super.initState();

    getAllTaskCount();
    getTask('New');
  }

  Future<void> getTask(String status) async {

    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.taskListByStatusURL(status),
    );

    List<TaskModel> tList = [];

    if (response.isSuccess) {

      for (Map<String, dynamic> jsonData
      in response.responseData['data']) {
        tList.add(TaskModel.fromJson(jsonData));
      }

    } else {

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.responseData['data'].toString(),
            ),
          ),
        );
      }
    }

    if (mounted) {
      setState(() {
        taskList = tList;
        isLoading = false;
      });
    }
  }

  Future<void> getAllTaskCount() async {

    final ApiResponse response = await ApiCaller.getRequest(
      url: TMUrls.taskStatusCountURL,
    );

    List<TaskStatusCountModel> taskCount = [];

    if (response.isSuccess) {

      for (Map<String, dynamic> jsonData
      in response.responseData['data']) {
        taskCount.add(
          TaskStatusCountModel.fromJson(jsonData),
        );
      }

    } else {

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.responseData['data'].toString(),
            ),
          ),
        );
      }
    }

    if (mounted) {
      setState(() {
        taskCountByStatus = taskCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: isLoading ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
          backgroundColor: Colors.grey,
          strokeWidth: 7,
        ),
      ) : Column(
        children: [

          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taskCountByStatus.length,

              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  child: TaskCardCount(
                    title: taskCountByStatus[index]
                        .sId
                        .toString(),

                    count: taskCountByStatus[index]
                        .sum!
                        .toInt(),
                  ),
                );
              },

              separatorBuilder:
                  (BuildContext context, int index) {
                return const SizedBox(width: 5);
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,

              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: taskList[index],
                  cardColor: Colors.blue,

                  refreshParent: () {
                    getAllTaskCount();
                    getTask('New');
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}