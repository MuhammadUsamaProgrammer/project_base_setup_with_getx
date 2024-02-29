import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yoked/Theme/colors.dart';

class SpinKitView extends StatelessWidget {
  final bool themeIsDark;
  final double size;

  const SpinKitView({
    this.themeIsDark = true,
    this.size = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeIsDark ? AppColor.primaryColor : Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            size: size,
            color: themeIsDark ? Colors.white : AppColor.primaryColor,
          ),
        ],
      ),
    );
  }
}
