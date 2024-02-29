import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Theme/colors.dart';
import 'package:yoked/Utils/loader.dart';

import '../../Common/AppBTN/primary_btn.dart';

import '../../Utils/fulkey_animation.dart';
import '../locale_selection.dart';

onLanguageSelectModal(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FunkyOverlay(child: const LangageSelectorView());
      });
}

class LangageSelectorView extends StatefulWidget {
  const LangageSelectorView({Key? key}) : super(key: key);

  @override
  _LangageSelectorViewState createState() => _LangageSelectorViewState();
}

class _LangageSelectorViewState extends State<LangageSelectorView> {
  final languageVM = Get.put(TranslationViewModel());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: 350,
      width: size.width - 60,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 330,
              width: size.width - 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomText(
                      title: "Change Language",
                      fontWeight: FontWeights.semiBold,
                      size: 18,
                      color: AppColor.darkText,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => LangageTile(
                        title: "English",
                        callback: () {
                          languageVM.onSelectLangaueg("en");
                        },
                        isSelected: languageVM.selectedLanguage.value == "en",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => LangageTile(
                        title: "العربية",
                        callback: () {
                          languageVM.onSelectLangaueg("ar");
                        },
                        isSelected: languageVM.selectedLanguage.value == "ar",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Spacer(),
                    PrimaryBTN(
                        callback: () {
                          showLoadingIndicator(context: context);
                          languageVM.changeLanguage(
                              languageVM.selectedLanguage.value);
                          hideOpenDialog(context: context);
                          Navigator.pop(context);
                        },
                        fontWeight: FontWeights.medium,
                        title: "Submit",
                        fontSize: 18,
                        color: AppColor.primaryColor,
                        width: AppConfig(context).width - 40),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.primaryColor,
                child: Center(
                  child: Icon(
                    Icons.clear,
                    size: 20,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LangageTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback callback;
  const LangageTile(
      {Key? key,
      required this.callback,
      required this.isSelected,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        height: 50,
        width: AppConfig(context).width - 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              // filterVM.selectedCategory.value.contains(widget.categoryModel.id)
              //     ? AppColor.buttonPrimaryColor
              //     :
              const Color(0xFFF9F9FC),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  title: title,
                  color: AppColor.darkText,
                  size: 20,
                  fontWeight: FontWeights.medium),
              Transform.scale(
                scale: 1,
                child: Checkbox(
                    visualDensity: VisualDensity.comfortable,
                    fillColor:
                        MaterialStateProperty.all<Color>(AppColor.primaryColor),
                    value: isSelected,
                    onChanged: (value) {
                      callback();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
