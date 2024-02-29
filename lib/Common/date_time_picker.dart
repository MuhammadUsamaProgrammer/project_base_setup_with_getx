import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Theme/colors.dart';

void showIOSDatePicker(
    {required BuildContext context, required Function onImageGet}) {
  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime dateTime = DateTime.now();
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 350,
      color: AppColor.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: AppColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText(
                    title: "Cancel",
                    color: AppColor.red,
                    fontWeight: FontWeights.medium,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onImageGet(dateTime);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    title: "Select",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeights.medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              // minimumYear: 1900,
              // maximumYear: DateTime.now().year,
              initialDateTime: DateTime(DateTime.now().year - 18),
              minimumDate: DateTime(1970),
              maximumDate: DateTime(DateTime.now().year - 10),
              // DateTime(DateTime.now().year - 20,
              //     DateTime.now().month, DateTime.now().day),
              onDateTimeChanged: (val) {
                dateTime = val;
              },
              backgroundColor: AppColor.white,
            ),
          ),
        ],
      ),
    ),
  );
}

void showIOSTimePicker(
    {required BuildContext context, required Function onImageGet}) {
  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  DateTime dateTime = DateTime.now();

  showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 350,
      color: AppColor.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: AppColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText(
                    title: "Cancel",
                    color: AppColor.red,
                    fontWeight: FontWeights.medium,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    onImageGet(dateTime);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    title: "Select",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeights.medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.time,
              use24hFormat: false,
              // This is called when the user changes the time.
              onDateTimeChanged: (DateTime newTime) {
                print(newTime);
                dateTime = newTime;
                // onImageGet(newTime);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
