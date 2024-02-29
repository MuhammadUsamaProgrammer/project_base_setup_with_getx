import 'package:flutter/material.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Constant/custom_assets.dart';
import 'package:yoked/Theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  VoidCallback callBack;
  bool isSignOut;
  String iconImage;
  String title;
  double iconScale;
  Color iconCircleColor;
  PrimaryButton(
      {super.key,
      this.iconScale = 3,
      this.iconImage = "assets/Icons/arrow_forward.png",
      this.title = "Next",
      this.iconCircleColor = const Color.fromARGB(255, 255, 0, 0),
      required this.callBack,
      this.isSignOut = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callBack();
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 57,
        width: AppConfig(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColor.darkText, width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap.w(39),
              CustomText(
                title: title,
                size: 19,
                color: AppColor.darkText,
                fontWeight: FontWeights.regular,
              ),
              Container(
                height: 39,
                width: 39,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: iconCircleColor,
                ),
                child: !isSignOut
                    ? Center(
                        child: Image.asset(
                          iconImage,
                          color: AppColor.white,
                          scale: iconImage == "assets/Icons/arrow_forward.png"
                              ? 2
                              : iconScale,
                        ),
                      )
                    : Row(
                        children: [
                          Gap.w(10),
                          Image.asset(
                            CustomAssets.signout,
                            color: AppColor.white,
                            scale: 3,
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
