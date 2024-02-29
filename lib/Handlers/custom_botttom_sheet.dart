import 'package:flutter/material.dart';

customBottomSheet({required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),

      // backgroundColor: AppColor.transparent,
      builder: (context) {
        //BackdropFilter(
        //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        return child;
      });
}
