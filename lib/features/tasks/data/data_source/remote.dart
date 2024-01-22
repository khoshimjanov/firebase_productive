import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/exception/exception.dart';

import '../models/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);

  factory TaskRemoteDataSource() => _TaskRemoteDataSourceImpl();
}

class _TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('tasks').get();

      final tasks = collection.docs
          .map((item) => TaskModel.fromJson(item.data(), item.id))
          .toList();

      return tasks;
    } catch (error) {
      print(error);
      throw ServerException(message: 'Xatolik yuz berdi!', code: 500);
    }
  }

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').add({
        'id':task.id,
        'title':task.title,
        'icon':task.icon,
        'note':task.note,
        'priority':task.priority,
        'created_at':task.startDate,
        'due_date':task.dueDate,
        'is_finished':task.isChecked,
      });
      // return tasks;
    } catch (error) {
      print(error);
      throw ServerException(message: 'Xatolik yuz berdi!', code: 500);
    }
  }
}
