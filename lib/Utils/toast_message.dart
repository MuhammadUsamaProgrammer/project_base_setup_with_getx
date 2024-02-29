import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Theme/colors.dart';

class ShowMessage {
  static onSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static onFail(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  onSessionExpirePopUp() {
    return Get.defaultDialog(
        title: "Session Expire!",
        titlePadding: const EdgeInsets.only(top: 20),
        onConfirm: () {},
        confirm: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () async {},
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryColor,
                border: Border.all(color: AppColor.primaryColor, width: 1.5),
              ),
              child: Center(
                child: CustomText(
                    title: "OK",
                    color: AppColor.white,
                    size: 17,
                    fontWeight: FontWeights.semiBold),
              ),
            ),
          ),
        ),
        content: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                    title:
                        "Please click on OK sign in again to refresh session.",
                    color: AppColor.greyText,
                    alignment: TextAlign.center,
                    size: 14,
                    fontWeight: FontWeights.regular),
              ],
            ),
          ),
        ),
        radius: 10.0);
  }
}
