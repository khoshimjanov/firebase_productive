import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TaskModel {
  final String id;
  final String title;
  final String icon;
  final String priority;
  final String? note;
  final Timestamp startDate;
  final Timestamp dueDate;
  final bool isChecked;
  TaskModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.priority,
    this.note,
    required this.startDate,
    required this.dueDate,
    required this.isChecked,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    
    return TaskModel(
      id: id,
      title: json['title'],
      icon: json['icon'],
      note: json['note'],
      priority: json['priority'],
      startDate: json['created_at'],
      dueDate: json['due_date'],
      isChecked: json['is_finished'],
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, icon: $icon, priority: $priority, note: $note, startDate: $startDate, dueDate: $dueDate, isChecked: $isChecked)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.icon == icon &&
        other.priority == priority &&
        other.note == note &&
        other.startDate == startDate &&
        other.dueDate == dueDate &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        icon.hashCode ^
        priority.hashCode ^
        note.hashCode ^
        startDate.hashCode ^
        dueDate.hashCode ^
        isChecked.hashCode ;
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? icon,
    String? priority,
    String? note,
    Timestamp? startDate,
    Timestamp? dueDate,
    bool? isChecked,
    Color? iconColor,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      priority: priority ?? this.priority,
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked
    );
  }
}
