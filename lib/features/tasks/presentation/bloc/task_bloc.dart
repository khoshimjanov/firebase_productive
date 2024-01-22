import 'dart:core';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/features/tasks/data/models/priority.dart';
import 'package:productive/features/tasks/data/models/status.dart';
import 'package:productive/features/tasks/data/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:productive/features/tasks/data/repository/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _response;
  TaskBloc({required TaskRepository response})
      : _response = response,
        super(TaskState(
            searchedTask: [],
            isSearching: false,
            selectIcon: AppIcons.titleIcon,
            selectIconcolor: activeColor,
            status: LoadingStatus.pure,
            tasklist: [],
            upcomingList: [],
            startDate: DateTime(2000, 1, 1, 10),
            endDate: DateTime(2000, 1, 1, 10))) {
    on<LoadingTask>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<TaskModel> ls = await _response.getTasks();
        print(ls);

        emit(
          state.copyWith(
            tasklist: ls,
            status: LoadingStatus.loadedWithSuccess,
            upcomingList: ls.where((element) => !element.isChecked).toList(),
          ),
        );
      } catch (e) {
        print('Error occured: $e');
        addError(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });
    on<CheckedTask>((event, emit) {
      var newList = <TaskModel>[];
      for (var i = 0; i < state.tasklist.length; i++) {
        if (state.tasklist[i].id == event.index) {
          newList.add(
            state.tasklist[i].copyWith(isChecked: !state.tasklist[i].isChecked),
          );
        } else {
          newList.add(state.tasklist[i]);
        }
      }
      emit(state.copyWith(
        tasklist: newList,
        upcomingList: newList.where((element) => !element.isChecked).toList(),
      ));
    });
    on<CreateStartDataTime>((event, emit) {
      emit(state.copyWith(startDate: event.time));
    });
    on<CreateEndDataTime>((event, emit) {
      emit(state.copyWith(endDate: event.time));
    });
    on<SelectIconButtonPressed>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(
                selectIcon: AppIcons.selectIconWork,
                selectIconcolor: selectIconWork),
          );
        case 1:
          emit(
            state.copyWith(
                selectIcon: AppIcons.selectIconStudy,
                selectIconcolor: englishStudy),
          );
        default:
          emit(
            state.copyWith(
                selectIcon: AppIcons.selectIconSport,
                selectIconcolor: gymColor),
          );
      }
    });
    on<SelectPriorityColor>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(priorityColor: redPriorty),
          );
        case 1:
          emit(
            state.copyWith(priorityColor: yellowPriority),
          );

        default:
          emit(
            state.copyWith(priorityColor: greenPriority),
          );
      }
    });
    on<CreateNewTaskButtonPressed>((event, emit) async {
      final id = Random(1000).toString();
      emit(state.copyWith(status: LoadingStatus.loading));
      final newTask = TaskModel(
          icon: event.icon,
          title: event.title,
          startDate: Timestamp.fromDate(event.startDate),
          dueDate: Timestamp.fromDate(event.dueDate),
          note: event.note,
          priority: event.priority,
          id: id,
          isChecked: false);
      await _response.add(
        TaskModel(
            icon: event.icon,
            title: event.title,
            startDate: Timestamp.fromDate(event.startDate),
            dueDate: Timestamp.fromDate(event.dueDate),
            note: event.note,
            priority: event.priority,
            id: id,
            isChecked: false),
      );
      final List<TaskModel> updateLIst = [...state.tasklist, newTask];
      event.onSuccess();
      emit(
        state.copyWith(
          priorityColor: Colors.transparent,
          selectIcon: AppIcons.titleIcon,
          selectIconcolor: activeColor,
          startDate: DateTime(2000, 1, 1, 10),
          endDate: DateTime(2000, 1, 1, 10),
        ),
      );

      try {
        emit(
          state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            tasklist: updateLIst,
            // upcomingList:
            //     updateLIst.where((TaskModel element) => !element.isCheck).toList() as List<TaskModel>,
          ),
        );
      } catch (e) {
        emit(state.copyWith(
          status: LoadingStatus.loadedWithFailure,
        ));
        event.onFailure('$e');
      }
    });
    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.tasklist
            .where((element) => element.title.contains(event.query))
            .toList();
        emit(state.copyWith(searchedTask: newList, isSearching: true));
      }
    });
  }
}
