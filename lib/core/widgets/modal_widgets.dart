import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';

class ExitBar extends StatelessWidget {
  const ExitBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AppIcons.divider),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(AppIcons.x),
            ),
          ),
        ),
      ],
    );
  }
}


class LineDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final double? leftPadding;
  final double? rightPadding;
  final Color? color;
  const LineDivider({super.key,
    this.height,
    this.width,
    this.leftPadding,
    this.rightPadding,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 16,right: rightPadding ?? 16),
      child: Container(
        width: width ?? double.maxFinite,
        height: height ?? 0.5,
        color: color ?? white,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double? leftPadding;
  final MainAxisAlignment? align;
  final VoidCallback onTap;
  const CustomTextButton({
    Key? key,
    required this.title,
     this.align,
    this.leftPadding,
    required this.onTap,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: align ?? MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(left: leftPadding ?? 16),
            child: Text(title,style:
            const TextStyle(fontSize: 16, color: white, decoration: TextDecoration.none),),
          ),
        ),
      ],
    );
  }


}

