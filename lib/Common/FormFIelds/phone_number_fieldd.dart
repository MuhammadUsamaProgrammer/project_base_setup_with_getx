// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:turber_mobile_flutter/Theme/colors.dart';
// import 'package:country_code_picker/country_code_picker.dart';

// validatePassword(String value) {
//   if (!(value.length > 5) && value.isNotEmpty) {
//     return "Password should contain more than 5 characters";
//   }
//   return null;
// }

// class PhoneNumberFieldTest extends StatefulWidget {
//   final bool isPadding;

//   final String hintText;

//   final String errorText;
//   final double width;

//   final bool isOptional;

//   final VoidCallback? callback;
//   final String sufixIcon;
//   final Function(String value) onChange;
//   final TextEditingController controller;
//   final TextInputType keyBoardType;
//   final int? maxLength;
//   PhoneNumberFieldTest({
//     Key? key,
//     this.maxLength,
//     required this.onChange,
//     this.isPadding = true,
//     this.keyBoardType = TextInputType.text,
//     this.isOptional = false,
//     this.sufixIcon = "",
//     required this.hintText,
//     required this.errorText,
//     required this.width,
//     required this.controller,
//     this.callback,
//   }) : super(key: key);

//   @override
//   _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
// }

// class _PhoneNumberFieldState extends State<PhoneNumberFieldTest> {
//   FocusNode focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: widget.isPadding ? 20 : 0),
//       child: TextFormField(
//           maxLength: widget.maxLength,
//           maxLengthEnforcement: widget.maxLength == null
//               ? MaxLengthEnforcement.none
//               : MaxLengthEnforcement.enforced,
//           controller: widget.controller,
//           keyboardType: widget.keyBoardType,
//           focusNode: focusNode,
//           cursorColor: AppColor.black,
//           style: TextStyle(color: AppColor.black, fontFamily: "poppins"),
//           validator: (value) {
//             if (value == null || value.isEmpty || value[0] != "+") {
//               return "Please enter valid mobile number";
//             }

//             return null;
//           },
//           onChanged: (value) {
//             widget.onChange(value);
//           },
//           onTap: widget.callback,
//           decoration: InputDecoration(
//               counter: const Offstage(),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: AppColor.greyBG),
//               ),
//               prefixIcon: const CountryCodePicker(
//                 onChanged: print,
//                 // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                 initialSelection: 'LB',
//                 favorite: ['+961', 'LB'],
//                 // optional. Shows only country name and flag
//                 showCountryOnly: false,
//                 // optional. Shows only country name and flag when popup is closed.
//                 showOnlyCountryWhenClosed: false,
//                 // optional. aligns the flag and the Text left
//                 alignLeft: false,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: AppColor.greyBG),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: AppColor.greyBG),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: AppColor.red),
//               ),
//               filled: true,
//               hintStyle: const TextStyle(
//                   color: Colors.black, fontSize: 15, fontFamily: "Quicksand"),
//               hintText: widget.hintText,
//               fillColor: AppColor.greyBG,
//               contentPadding:
//                   const EdgeInsets.only(left: 20, top: 15, bottom: 0))),
//     );
//   }
// }

// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }
