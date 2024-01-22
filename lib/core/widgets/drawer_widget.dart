import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DrawerWidget extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){ onTap();},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(16),
          SvgPicture.asset(icon),
          const Gap(12),
          Text(title,style: Theme.of(context).textTheme.bodyMedium!.
          copyWith(fontSize: 16,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

  const DrawerWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
