import 'package:flutter/material.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Theme/colors.dart';

class IconBTN extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback? callback;
  final double height;
  final double fontSize;
  final double borderRadius;
  final bool isBorder;
  final bool isSecondary;
  final Color color;
  final Color textCLR;
  final FontWeight fontWeight;
  final Widget icon;

  const IconBTN({
    super.key,
    this.borderRadius = 33,
    required this.icon,
    this.isSecondary = false,
    required this.callback,
    required this.color,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.height = 54,
    this.isBorder = false,
    this.textCLR = Colors.white,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: isBorder
            ? BoxDecoration(
                border: Border.all(
                  color: AppColor.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(borderRadius))
            : BoxDecoration(
                color:
                    isSecondary || isBorder ? const Color(0xFFF9F9FC) : color,
                // border: isBorder
                //     ? Border.all(
                //         color: AppColor.darkText.withOpacity(0.2),
                //         width: 1,
                //       )
                //     : const Border(),
                // gradient: const LinearGradient(
                //     begin: Alignment.centerLeft,
                //     end: Alignment.centerRight,
                //     colors: [AppColor.primaryColor, AppColor.secondaryColor]

                //     ),
                borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            CustomText(
                title: title,
                color: textCLR,
                size: fontSize,
                fontWeight: fontWeight),
            const Spacer(),
            icon,
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
