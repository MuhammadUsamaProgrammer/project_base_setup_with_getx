import 'package:flutter/material.dart';
import 'package:yoked/Theme/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final Function callBack;
  const CustomCheckBox(
      {super.key, required this.value, required this.callBack});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      this.value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callBack(value);
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
            )),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: this.value ? AppColor.primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
