import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

Widget cacheImageView({
  required String image,
  BoxFit boxfit = BoxFit.fill,
  double circlularPadding = 10,
  double errorIconSize = 10,
  bool isEasyLoader = false,
  bool isProfilePlaceholder = false,
  Color imageColor = Colors.transparent,
}) {
  // return CachedNetworkImage(
  return image.isNotEmpty && image != "string"
      ? isEasyLoader
          ? CachedNetworkImage(
              imageUrl: image,
              fit: boxfit,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: EdgeInsets.all(circlularPadding),
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Image(
                image: isProfilePlaceholder
                    ? AssetImage("assets/profilePlaceholder.jpg")
                    : AssetImage("assets/placeholder.png"),
                fit: BoxFit.cover,
              ),
            )
          : CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => Image(
                image: isProfilePlaceholder
                    ? AssetImage("assets/profilePlaceholder.jpg")
                    : AssetImage("assets/placeholder.png"),
                fit: BoxFit.cover,
              ),
              fit: boxfit,
              errorWidget: (context, url, error) => Image(
                image: isProfilePlaceholder
                    ? AssetImage("assets/profilePlaceholder.jpg")
                    : AssetImage("assets/placeholder.png"),
                fit: BoxFit.cover,
              ),
            )
      : Image(
          image: isProfilePlaceholder
              ? AssetImage("assets/profilePlaceholder.jpg")
              : AssetImage("assets/placeholder.png"),
          fit: BoxFit.cover,
        );
}
