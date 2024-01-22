import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/widgets/modal_widgets.dart';
import 'package:productive/core/widgets/w_button.dart';

Future<DateTime?> selectTime(BuildContext context) async {
DateTime callingDate = DateTime.now();
   await showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        decoration: const BoxDecoration(
            color: Color(0xFF303745),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        height: 268,
        child: Column(
          children: [
            const ExitBar(),
            const Gap(65),
                 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(
                  '${callingDate.day} / ${callingDate.month} / ${callingDate.year}',
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decorationColor: Color(0xFF303745),
                  ),
                )
              ],
            ),
            const Gap(26),
            const LineDivider(),
            const Gap(21),
            CustomTextButton(
              leftPadding: 17,
              title: 'Add Time',
              onTap: () {
                showCupertinoModalPopup(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext builderContext) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF303745),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24), topRight: Radius.circular(24)
                          )
                      ),
                      height: 378,
                      child: Column(
                        children: [
                          const ExitBar(),
                          const Gap(20),
                          Expanded(
                            child: CupertinoDatePicker(
                              dateOrder: DatePickerDateOrder.dmy,
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: callingDate,
                              onDateTimeChanged: (DateTime newDateTime) {
                                callingDate = newDateTime;
                              },
                              use24hFormat: false,
                              minuteInterval: 1,
                            ),
                          ),
                          const Gap(22),
                          const LineDivider(),
                          const Gap(16),
                          CustomTextButton(
                            leftPadding: 17,
                            title: 'Add Time',
                            onTap: () {

                              showCupertinoModalPopup(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext builderContext)
                                {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF303745),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24),
                                            topRight: Radius.circular(24)
                                        )
                                    ),
                                    height: 378,
                                    child: Column(
                                      children: [
                                        const ExitBar(),
                                        const Gap(36),
                                        Text(
                                          '${callingDate.day} / ${callingDate.month} / ${callingDate.year}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            decorationColor: Color(0xFF303745),
                                          ),
                                        ),
                                        const Gap(26),
                                        const LineDivider(),
                                        const Gap(14),
                                        Expanded(
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.time,
                                            initialDateTime: callingDate,
                                            onDateTimeChanged: (DateTime newDateTime) {
                                              callingDate = callingDate.copyWith(hour: newDateTime.hour,minute: newDateTime.minute,);
                                            },
                                            use24hFormat: false,
                                            minuteInterval: 1,
                                          ),
                                        ),
                                        const Gap(35),

                                        CustomTextButton(
                                          leftPadding: 17,
                                          title: 'Remove time',
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const Gap(4),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: LineDivider(
                                            height: 1,
                                            width: 74,
                                          ),
                                        ),
                                        const Gap(7),
                                        WButton(
                                          width: 121,
                                          height: 30,
                                          text: 'Confirm',
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                            // Additional logic for WButton press
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                            },
                          ),
                          const Gap(4),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: LineDivider(
                              height: 1,
                              width: 74,
                            ),
                          ),
                          const Gap(7),
                          WButton(
                            width: 121,
                            height: 30,
                            text: 'Confirm',
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
                // _selectDate(context,callingDate);
              },
            ),
            const Gap(4),
            const Align(
              alignment: Alignment.centerLeft,
              child: LineDivider(
                height: 1,
                width: 74,
              ),
            ),
            const Gap(14),
            WButton(
              width: 121,
              height: 30,
              text: "Confirm",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
  return callingDate;
}
