// ignore_for_file: public_member_api_docs, sort_constructors_first










part of 'task_bloc.dart';

class TaskState {
  final LoadingStatus status;
  final List<TaskModel> tasklist;
  final List<TaskModel> upcomingList;
  final List<TaskModel> searchedTask;
  final DateTime startDate;
  final DateTime endDate;
  final Color selectIconcolor;
  final String selectIcon;
  final Color? priorityColor;
  final bool isSearching;
  TaskState({
    required this.status,
    required this.tasklist,
    required this.upcomingList,
    required this.searchedTask,
    required this.startDate,
    required this.endDate,
    required this.selectIconcolor,
    required this.selectIcon,
    this.priorityColor,
    required this.isSearching,
  });
  

  TaskState copyWith({
    LoadingStatus? status,
    List<TaskModel>? tasklist,
    List<TaskModel>? upcomingList,
    List<TaskModel>? searchedTask,
    DateTime? startDate,
    DateTime? endDate,
    Color? selectIconcolor,
    String? selectIcon,
    Color? priorityColor,
    bool? isSearching,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasklist: tasklist ?? this.tasklist,
      upcomingList: upcomingList ?? this.upcomingList,
      searchedTask: searchedTask ?? this.searchedTask,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      selectIconcolor: selectIconcolor ?? this.selectIconcolor,
      selectIcon: selectIcon ?? this.selectIcon,
      priorityColor: priorityColor ?? this.priorityColor,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return 'TaskState(status: $status, tasklist: $tasklist, upcomingList: $upcomingList, searchedTask: $searchedTask, startDate: $startDate, endDate: $endDate, selectIconcolor: $selectIconcolor, selectIcon: $selectIcon, priorityColor: $priorityColor, isSearching: $isSearching)';
  }

  @override
  bool operator ==(covariant TaskState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      listEquals(other.tasklist, tasklist) &&
      listEquals(other.upcomingList, upcomingList) &&
      listEquals(other.searchedTask, searchedTask) &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.selectIconcolor == selectIconcolor &&
      other.selectIcon == selectIcon &&
      other.priorityColor == priorityColor &&
      other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      tasklist.hashCode ^
      upcomingList.hashCode ^
      searchedTask.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      selectIconcolor.hashCode ^
      selectIcon.hashCode ^
      priorityColor.hashCode ^
      isSearching.hashCode;
  }
}


