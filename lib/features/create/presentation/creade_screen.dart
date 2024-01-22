import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/features/create/presentation/pages/add_location.dart';
import 'package:productive/features/create/presentation/pages/select_data_time.dart';
import 'package:productive/features/create/presentation/pages/select_icon_bottom_sheet.dart';
import 'package:productive/features/tasks/data/models/priority.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late final TextEditingController controllerTile;
  late final TextEditingController noteController;
  DateTime? dateStartTime;
  DateTime? dataEndTime;
  int? priorityIndex;
  @override
  void initState() {
    controllerTile = TextEditingController();
    noteController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppIcons.backPage)),
              ),
              title: Text(
                "Create Task",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.571),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: state.selectIconcolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print(state.tasklist);
                              SelectIcon(context);
                            },
                            child: SvgPicture.asset(state.selectIcon),
                          ),
                        ),
                        const Gap(18),
                        Expanded(
                          child: TextField(
                            controller: controllerTile,
                            cursorColor: cursorColor,
                            decoration: InputDecoration(
                              hintText: "New title",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: greyish,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final time = await selectTime(context);
                          if (time != null) {
                            dateStartTime = time.copyWith(
                                hour: time.hour, minute: time.minute);
                            print("start time  --- $dateStartTime");
                          }
                          context.read<TaskBloc>().add(
                                CreateStartDataTime(time: dateStartTime!),
                              );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: activeColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const Gap(7),
                            Text(
                              getProperTime(state.startDate, state.startDate),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: greyish),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 100) * 41,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final time = await selectTime(context);
                          if (time != null) {
                            dataEndTime = time.copyWith(
                                hour: time.hour, minute: time.minute);
                            print("end time  --- $dataEndTime");
                          }
                          context.read<TaskBloc>().add(
                                CreateEndDataTime(time: dataEndTime!),
                              );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: activeColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const Gap(7),
                            Text(
                              getProperTime(state.endDate, state.endDate),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: greyish),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(34),
                  Text(
                    "Priority",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: activeColor),
                  ),
                  const Gap(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              priorityIndex = index;
                              context.read<TaskBloc>().add(
                                    SelectPriorityColor(index: index),
                                  );
                            },
                            child: Container(
                              width: 75,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: getColorPrioriyt(index) ==
                                        state.priorityColor
                                    ? state.priorityColor
                                    : null,
                                border: Border.all(
                                  color: getColorPrioriyt(index),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                getTextPriority(index),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: noteController,
                    maxLines: 5,
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                      fillColor: textFieldBackgroundColor2,
                      hintText: "Add note...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: greyish),
                      border: InputBorder.none,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addLocation(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(AppIcons.addLocation),
                        ),
                        const Gap(11),
                        Text(
                          "Add locataion",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: allPageTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(19),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(AppIcons.addNotification),
                      ),
                      const Gap(11),
                      Text(
                        "Add notification",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: allPageTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 16,
                right: 16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  print(state.tasklist);
                  if (state.selectIcon == AppIcons.titleIcon) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        onVisible: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        content: Text('Icon cannot be null'),
                        actions: [SizedBox()],
                      ),
                    );
                    return;
                  }
                  if (controllerTile.text.length < 3) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        onVisible: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        content: Text('Title cannot be null'),
                        actions: [SizedBox()],
                      ),
                    );
                    return;
                  }
                  if (dateStartTime == null || dataEndTime == null) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        onVisible: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        content: Text('Vaqt belgilanmadi'),
                        actions: [SizedBox()],
                      ),
                    );
                    return;
                  }
                  if (priorityIndex == null) {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        onVisible: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        content: Text('Prioriyt cannot be null'),
                        actions: [SizedBox()],
                      ),
                    );
                    return;
                  }

                  context.read<TaskBloc>().add(
                        CreateNewTaskButtonPressed(
                          note: noteController.text,
                          title: controllerTile.text,
                          icon: state.selectIcon,
                          priority: getPrioriyt(priorityIndex!).toString(),
                          startDate: dateStartTime!,
                          dueDate: dataEndTime!,
                          isChecked: false,
                          iconColor: state.selectIconcolor,
                          onSuccess: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          onFailure: (errorMassage) {
                            ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                onVisible: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentMaterialBanner();
                                },
                                content: Text(errorMassage),
                                actions: const [
                                  SizedBox(),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                },
                child: Text(
                  "Save",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Priority getPrioriyt(int index) {
    switch (index) {
      case 0:
        return Priority.high;
      case 1:
        return Priority.medium;

      default:
        return Priority.low;
    }
  }

  String getTextPriority(int index) {
    switch (index) {
      case 0:
        return "High";
      case 1:
        return "Medium";
      case 2:
        return "Low";
      default:
        return "";
    }
  }

  Color getColorPrioriyt(int index) {
    switch (index) {
      case 0:
        return redPriorty;
      case 1:
        return yellowPriority;
      default:
        return greenPriority;
    }
  }

  @override
  void dispose() {
    controllerTile.dispose();
    noteController.dispose();
    super.dispose();
  }

  String getProperTime(DateTime date, DateTime minut) {
    if (date.hour > 12) {
      final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
      final hour = soat < 10 ? '0$soat' : '$soat';
      final minute = minut.minute < 10 ? '0${minut.minute}' : '${minut.minute}';

      return "$hour:$minute PM";
    } else {
      final soat = date.hour >= 12 ? date.hour - 12 : date.hour;
      final hour = soat < 10 ? '0$soat' : '$soat';
      final minute = minut.minute < 10 ? '0${minut.minute}' : '${minut.minute}';

      return "$hour:$minute AM";
    }
  }
}
