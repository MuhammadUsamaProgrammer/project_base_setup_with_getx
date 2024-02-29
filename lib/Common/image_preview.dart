import 'package:flutter/material.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Common/AppText/font_type.dart';
import 'package:yoked/Handlers/cache_image_view.dart';
import 'package:yoked/Theme/colors.dart';

class ImagePreview extends StatelessWidget {
  final String path;
  const ImagePreview({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  iconSize: 35,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                    size: 20,
                  )),
              Spacer(),
              CustomText(
                title: "Preview",
                fontType: FontType.Roboto,
                size: 18,
                color: AppColor.darkText,
                fontWeight: FontWeights.medium,
              ),
              Spacer(),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Spacer(),
          if (path.isNotEmpty)
            Center(child: cacheImageView(image: path, boxfit: BoxFit.fill)),
          Spacer(),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
