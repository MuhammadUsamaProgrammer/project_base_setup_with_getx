import 'package:flutter/material.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Theme/colors.dart';

Future onSelectFromList(
    {required BuildContext context,
    required List<String> listOfData,
    required String title,
    required Function onSelect}) {
  return showModalBottomSheet(
    backgroundColor: Colors.white.withOpacity(0),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              // color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CustomText(
                        title: title,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeights.semiBold,
                        size: 20),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: listOfData.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView.builder(
                              itemCount: listOfData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    onSelect(listOfData[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          title: listOfData[index],
                                          size: 14,
                                          color: AppColor.darkText,
                                          fontWeight: FontWeights.medium,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            child: Center(
                                child: CustomText(title: "No data Found"))),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
