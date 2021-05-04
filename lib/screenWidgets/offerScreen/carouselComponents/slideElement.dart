import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecshop_git/themes/light_color.dart';

class SlideElement extends StatelessWidget {
  final String image;

  const SlideElement({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (ctx, imageProvider) => Container(
            width: 0.92.sw,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: LightColors.primaryColor,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => SpinKitCircle(
            color: LightColors.primaryColor,
            size: 45,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
