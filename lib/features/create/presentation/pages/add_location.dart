import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/assets/constants/images.dart';

Future<dynamic> addLocation(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: upcomingLinkBolt,
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: (MediaQuery.of(context).size.width / 100) * 21.5,
                    height: 4,
                    decoration: BoxDecoration(color: modalBottomSheetTop),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
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
              ),
              Container(
                height: 174,
                child: Image.asset(
                  AppImages.locationMap,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(13.5),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      child: SvgPicture.asset(AppIcons.addCordinata),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    "Add coordinate",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: activeColor),
                  ),
                ],
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Add Location",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
