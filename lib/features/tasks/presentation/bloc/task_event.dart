// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class LoadingTask extends TaskEvent {}

class CheckedTask extends TaskEvent {
  final String index;
  CheckedTask({
    required this.index,
  });
}

class CreateStartDataTime extends TaskEvent {
  final DateTime time;
  CreateStartDataTime({
    required this.time,
  });

  CreateStartDataTime copyWith({
    DateTime? time,
  }) {
    return CreateStartDataTime(
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(covariant CreateStartDataTime other) {
    if (identical(this, other)) return true;

    return other.time == time;
  }

  @override
  int get hashCode => time.hashCode;

  @override
  String toString() => 'CreateStartDataTime(time: $time)';
}

class CreateEndDataTime extends TaskEvent {
  final DateTime time;
  CreateEndDataTime({
    required this.time,
  });

  CreateEndDataTime copyWith({
    DateTime? time,
  }) {
    return CreateEndDataTime(
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(covariant CreateEndDataTime other) {
    if (identical(this, other)) return true;

    return other.time == time;
  }

  @override
  int get hashCode => time.hashCode;

  @override
  String toString() => 'CreateEndDataTime(time: $time)';
}

class SelectIconButtonPressed extends TaskEvent {
  final int index;
  SelectIconButtonPressed({
    required this.index,
  });
}

class SelectPriorityColor extends TaskEvent {
  final int index;
  SelectPriorityColor({
    required this.index,
  });

  SelectPriorityColor copyWith({
    int? index,
  }) {
    return SelectPriorityColor(
      index: index ?? this.index,
    );
  }

  @override
  String toString() => 'SelectPriorityColor(index: $index)';

  @override
  bool operator ==(covariant SelectPriorityColor other) {
    if (identical(this, other)) return true;

    return other.index == index;
  }

  @override
  int get hashCode => index.hashCode;
}

class CreateNewTaskButtonPressed extends TaskEvent {
  
  final String title;
  final String icon;
  final String priority;
  final String? note;
  final DateTime startDate;
  final DateTime dueDate;
  final bool isChecked;
  final Color iconColor;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateNewTaskButtonPressed({
    required this.title,
    required this.icon,
    required this.priority,
    this.note,
    required this.startDate,
    required this.dueDate,
    required this.isChecked,
    required this.iconColor,
    required this.onSuccess,
    required this.onFailure,
  });

  CreateNewTaskButtonPressed copyWith({
    String? title,
    String? icon,
    Priority? priority,
    String? note,
    DateTime? startDate,
    DateTime? dueDate,
    bool? isChecked,
    Color? iconColor,
    VoidCallback? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    return CreateNewTaskButtonPressed(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      priority: priority.toString(),
      note: note ?? this.note,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked,
      iconColor: iconColor ?? this.iconColor,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
    );
  }

  @override
  bool operator ==(covariant CreateNewTaskButtonPressed other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.icon == icon &&
      other.priority == priority &&
      other.note == note &&
      other.startDate == startDate &&
      other.dueDate == dueDate &&
      other.isChecked == isChecked &&
      other.iconColor == iconColor &&
      other.onSuccess == onSuccess &&
      other.onFailure == onFailure;
  }

  @override
  int get hashCode {
    return 
      title.hashCode ^
      icon.hashCode ^
      priority.hashCode ^
      note.hashCode ^
      startDate.hashCode ^
      dueDate.hashCode ^
      isChecked.hashCode ^
      iconColor.hashCode ^
      onSuccess.hashCode ^
      onFailure.hashCode;
  }

  @override
  String toString() {
    return 'CreateNewTaskButtonPressed(title: $title, icon: $icon, priority: $priority, note: $note, startDate: $startDate, dueDate: $dueDate, isChecked: $isChecked, iconColor: $iconColor, onSuccess: $onSuccess, onFailure: $onFailure)';
  }
}
class Searching extends TaskEvent {
  final String query;
  Searching({
    required this.query,
  });
  
 }
