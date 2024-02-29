// ignore_for_file: curly_braces_in_flow_control_structures, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Constant/custom_assets.dart';
import 'package:yoked/Theme/colors.dart';

validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return "Password should contain more than 5 characters";
  }
  return null;
}

class PrimaryTextField extends StatefulWidget {
  final bool isPass;
  final String countryCode;
  final bool isEmail;
  final bool isPadding;
  final String hintText;

  final String headingText;
  final String errorText;
  final double width;
  double? fieldWidth;
  final String prefixIcon;
  final bool isName;
  final bool readOnly;
  final double height;
  final bool isOptional;
  final int maxLine;
  final VoidCallback? callback;
  final String sufixIcon;
  final Function(String value) onChange;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final int? maxLength;
  final Color fillColor;
  final Color? borderColorCustom;
  PrimaryTextField(
      {Key? key,
      this.countryCode = "",
      required this.isPass,
      this.height = 60,
      this.maxLength,
      this.borderColorCustom,
      required this.onChange,
      this.fillColor = Colors.white,
      this.isPadding = true,
      this.keyBoardType = TextInputType.text,
      this.isEmail = false,
      this.readOnly = false,
      this.isOptional = false,
      this.isName = false,
      this.sufixIcon = "",
      this.prefixIcon = "",
      required this.hintText,
      required this.errorText,
      required this.width,
      this.fieldWidth,
      required this.controller,
      this.callback,
      required this.headingText,
      this.maxLine = 1})
      : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool _showPassword = false;
  String countryCode = "+966";
  @override
  void initState() {
    super.initState();
    if (widget.countryCode.isNotEmpty) countryCode = widget.countryCode;
    if (widget.isPass) {
      _showPassword = true;
    }
    if (widget.borderColorCustom != null) {
      borderColor = widget.borderColorCustom!;
    }
  }

  FocusNode focusNode = FocusNode();
  Color borderColor = AppColor.primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isPadding ? 20 : 0),
      child: Container(
        height: widget.height,
        width: widget.fieldWidth == null
            ? AppConfig(context).width
            : widget.fieldWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: borderColor, width: 1.5)),
          // border: Border.all(color: borderColor, width: 2),
          // borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomText(
              //   title: widget.headingText,
              //   size: 12,
              //   fontWeight: FontWeight.w300,
              //   color: AppColor.greyText,
              // ),
              Expanded(
                child: TextFormField(
                  maxLength: widget.maxLength,
                  maxLengthEnforcement: widget.maxLength == null
                      ? MaxLengthEnforcement.none
                      : MaxLengthEnforcement.enforced,
                  readOnly: widget.readOnly,
                  controller: widget.controller,
                  obscureText: _showPassword,
                  obscuringCharacter: '*',
                  keyboardType: widget.keyBoardType,
                  focusNode:
                      widget.readOnly ? AlwaysDisabledFocusNode() : focusNode,
                  cursorColor: AppColor.primaryColor,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeights.medium,
                      color: AppColor.darkText,
                      fontFamily: "poppins"),
                  maxLines: widget.maxLine,
                  validator: (value) {
                    if (widget.isEmail) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(value)) {
                        setState(() {
                          borderColor = Colors.red;
                        });
                        return "Please enter valid Email";
                      }
                    } else if (widget.isPass) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        setState(() {
                          borderColor = Colors.red;
                        });
                        return "Password must contains more than 6 char";
                      }
                    } else if (widget.isOptional && (value!.isEmpty)) {
                      setState(() {
                        borderColor = AppColor.primaryColor;
                      });
                      return null;
                    } else if (value == null || value.isEmpty) {
                      setState(() {
                        borderColor = Colors.red;
                      });
                      return widget.errorText;
                    }
                    setState(() {
                      borderColor = AppColor.primaryColor;
                    });
                    return null;
                  },
                  onChanged: (value) {
                    widget.onChange(value);
                  },
                  onTap: widget.callback,
                  decoration: InputDecoration(
                      counter: const Offstage(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: widget.prefixIcon.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, left: 15, bottom: 15, top: 15),
                              child: Image(
                                height: 10,
                                width: 20,
                                // color: AppColor.greyText,
                                image: AssetImage(widget.prefixIcon),
                              ),
                            )
                          : null,
                      suffixIcon: widget.isPass
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 14, left: 14, bottom: 5, top: 12),
                                child: Image(
                                    height: 10,
                                    width: 10,
                                    // color: AppColor.black,
                                    image: _showPassword
                                        ? AssetImage(
                                            CustomAssets.hidden,
                                          )
                                        : AssetImage(
                                            CustomAssets.eye,
                                          )),
                              )
                              //  Icon(
                              //   _showPassword
                              //       ? Icons.visibility
                              //       : Icons.visibility_off,
                              //   color: Colors.grey,
                              // ),
                              )
                          : widget.sufixIcon.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 15, bottom: 5, top: 30),
                                  child: Image(
                                    height: 10,
                                    width: 20,
                                    // color: AppColor.greyText,
                                    image: AssetImage(widget.sufixIcon),
                                  ),
                                )
                              : null,
                      filled: true,
                      label: widget.headingText.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: CustomText(
                                color: AppColor.greyText,
                                title: widget.headingText,
                                size: 14,
                                fontWeight: FontWeight.w400,
                              ))
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      // labelText: widget.headingText,
                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                      // labelStyle: const TextStyle(
                      //     height: 1,
                      //     fontWeight: FontWeight.w300,
                      //     color: AppColor.greyText,
                      //     fontSize: 16,
                      //     fontFamily: "Poppins"),
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyText,
                          fontSize: 16,
                          fontFamily: "Poppins"),
                      hintText: widget.hintText,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.only(
                          left: 0, top: 8, bottom: 0, right: 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
