import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecshop_git/providers/offerProvider.dart';
import 'package:tecshop_git/screenWidgets/offerScreen/carouselComponents/slideElement.dart';

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    final offerProvider = Provider.of<OfferProvider>(context, listen: false);

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: offerProvider.offerList.length,
            options: CarouselOptions(
              height: 150,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              viewportFraction: 0.98,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(milliseconds: 3500),
              autoPlayAnimationDuration: Duration(milliseconds: 1500),
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,
            ),
            carouselController: buttonCarouselController,
            itemBuilder: (context, index, x) => SlideElement(image: offerProvider.offerList[index].imageUrl),
          ),
        ],
      ),
    );
  }
}
