import 'dart:ui';

import 'package:productive/features/tasks/data/data_source/remote.dart';
import 'package:productive/features/tasks/data/models/priority.dart';
import 'package:productive/features/tasks/data/repository/mock_data.dart';
import 'package:productive/features/tasks/data/models/task.dart';

class TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepository({required this.taskRemoteDataSource});
  Future<List<TaskModel>> getTasks()async {

    return taskRemoteDataSource.getTasks();



    
    // return (data['tasks']as List).map((e) => TaskModel.fromJson(e)).toList();

  }
  Future<void> add(TaskModel task)async {

     taskRemoteDataSource.addTask(task);



    
    // return (data['tasks']as List).map((e) => TaskModel.fromJson(e)).toList();

  }
  
}