import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tecshop_git/providers/productProvider.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'package:tecshop_git/globalWidgets/circleIcon.dart';

class ShareButton extends StatelessWidget {
  final double iconSize;

  const ShareButton({Key key, this.iconSize = 35}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    return CircleIcon(
      borderColor: Colors.grey.withOpacity(0.22),
      size: iconSize,
      icon: Icon(
        Icons.share,
        color: LightColors.primaryColor,
      ),
      onPress: () async {
        await Share.share(
          '${productProvider.currentProductModel.title} \n${productProvider.currentProductModel.imageUrl}',
          subject: 'Shared image from TecShop APP',
        );
      },
    );
  }
}
