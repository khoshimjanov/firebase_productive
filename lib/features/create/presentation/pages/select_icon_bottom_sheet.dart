import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';

Future<dynamic> SelectIcon(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: upcomingLinkBolt,
      context: context,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 24,
                          width: 24,
                          child: GestureDetector( 
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(AppIcons.selectIconBack)),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                      fillColor: createSearchColor,
                      hintText: "Search by category..",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: allPageTextColor),
                      prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(AppIcons.selectIconSearch),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ...List.generate(3, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<TaskBloc>().add(SelectIconButtonPressed(index: index),);
                    },
                    child: ListTile(
                      
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: getColor(index),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          getIcon(index),
                        ),
                      ),
                      title: Text(
                        getTitle(index),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              );
            })
          ],
        );
      });
}

String getIcon(int index) {
  switch (index) {
    case 0:
      return AppIcons.selectIconWork;
    case 1:
      return AppIcons.selectIconStudy;
    default:
      return AppIcons.selectIconSport;
  }
}
String getTitle(int index) {
  switch (index) {
    case 0:
      return "Work";
    case 1:
      return "Study";
    default:
      return "Sport";
  }
}

Color getColor(int index) {
  switch (index) {
    case 0:
      return selectIconWork;
    case 1:
      return englishStudy;
    default:
      return gymColor;
  }
}
