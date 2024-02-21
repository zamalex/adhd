import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'my_progreess.dart';

class ImageeNetworkWidget extends StatelessWidget {
  String image = "";
  double? height;
  double? width;
  ImageeNetworkWidget({Key? key, required this.image, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image,
      fit: BoxFit.fill,
      placeholder: (context, url) => MyProgressWidget(),
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/2-01 1logo_white.png",
        height: height,
        width: width,
      ),
    );
  }
}

class RoundedImageeNetworkWidget extends StatelessWidget {
  String image = "";
  double? height;
  double? width;
  RoundedImageeNetworkWidget(
      {Key? key, required this.image, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => MyProgressWidget(),
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/Group 4804@3x.png",
        height: height,
        width: width,
      ),
    );
  }
}
/*
 imageBuilder: (context, imageProvider) => Container(
    width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: imageProvider, fit: BoxFit.cover),
    ),
  ),
*/