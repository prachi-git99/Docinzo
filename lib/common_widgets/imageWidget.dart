import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../consts/consts.dart';

Widget imageWidget({context, img, height, width}) {
  var size = MediaQuery.of(context).size;
  return CachedNetworkImage(
    imageUrl: "$img",
    imageBuilder: (context, imageProvider) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondaryColor,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    fit: BoxFit.contain,
    errorWidget: (context, url, error) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: secondaryColor,
      ),
      child: Center(
          child: Icon(
        CupertinoIcons.photo,
        color: primaryColor,
        size: size.height * 0.05,
      )),
    ),
    placeholder: (context, url) => Container(
      width: width,
      height: height,
      child: Center(
          child: Icon(
        CupertinoIcons.photo,
        color: primaryColor,
        size: size.height * 0.05,
      )),
    ),
  );
}
