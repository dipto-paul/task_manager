import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../models/task_model.dart';
import '../service/api_caller.dart';
import '../utils/urls.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  bool isLoading = true;

  List<TaskModel> taskList = [];

  @override
  void initState() {
    super.initState();
    getTask('Progress');
  }

  Future<void> getTask(String status) async {

    setState(() {
      isLoading = true;
    });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
          backgroundColor: Colors.grey,
        ),
      )

          : ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskCard(
            taskModel: taskList[index],
            cardColor: Colors.purple,
            refreshParent: () {},
          );
        },
      ),
    );
  }
}