import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecshop_git/generalFunctions.dart';
import 'package:tecshop_git/screenWidgets/homeScreen/titleHeader.dart';
import 'package:tecshop_git/themes/light_color.dart';

class MercadoBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleHeader(
          text: 'TecShop is a small (Open source) version of Mercado',
          borderColor: LightColors.mercadoBColor,
          textColor: LightColors.mercadoBColor,
          fontSize: 17,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1, color: LightColors.lightGreyColor), borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: SvgPicture.asset('assets/icons/mercado.svg'),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Download Mercado App',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 18,
                            color: LightColors.mercadoBColor,
                          ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () => GeneralFunctions.openUrl('https://play.google.com/store/apps/details?id=mercado.com'),
          ),
        ),
      ],
    );
  }
}
