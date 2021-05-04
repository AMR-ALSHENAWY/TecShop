import 'package:flutter/material.dart';
import 'package:tecshop_git/globalWidgets/backBtnPop.dart';
import 'package:photo_view/photo_view.dart';

class ShowImageScreen extends StatelessWidget {
  static const String routName = '/showImageScreen';
  final String imageUrl;

  const ShowImageScreen({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackBtnPop(),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: PhotoView(
          maxScale: 10.5,
          minScale: 0.5,
          imageProvider: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
