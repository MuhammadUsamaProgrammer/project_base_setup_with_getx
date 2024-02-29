// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yoked/Theme/colors.dart';

class FilePickerHnadler {
  static Future showVideoPicker(
      {required BuildContext context, required Function onGetImage}) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              vidFromCamera()
                                  .then((value) => onGetImage(value));
                            },
                            child: Container(
                              height: 48,
                              // width: 0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Record Video",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              vidFromGallery()
                                  .then((value) => onGetImage(value));
                            },
                            child: Container(
                              height: 48,
                              // width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Gallery Video",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("cancel");
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      // width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ),
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

  static Future showImagePicker(
      {required BuildContext context, required Function onGetImage}) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              imgFromCamera()
                                  .then((value) => onGetImage(value));
                            },
                            child: Container(
                              height: 48,
                              // width: 0,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Take photo",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              imgFromGallery()
                                  .then((value) => onGetImage(value));
                            },
                            child: Container(
                              height: 48,
                              // width: 60,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Gallery Photo",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("cancel");
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      // width: 60,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ),
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

  static Future<dynamic> imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    return image;
  }

  static Future<dynamic> vidFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickVideo(source: ImageSource.camera);

    return image;
  }

  static Future<dynamic> vidFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);

    return image;
  }

  static Future<dynamic> imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    return image;
  }
}
