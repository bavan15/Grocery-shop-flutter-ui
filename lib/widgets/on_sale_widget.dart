import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/heart_btn.dart';
import 'package:grocery_app_course/widgets/price_widget.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: <Widget>[
                        TextWidget(
                          title: '1KG',
                          textSize: 22,
                          color: color,
                          isTitle: true,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => print('OnSaleWidget.build'),
                              child: Icon(
                                IconlyLight.bag2,
                                size: 22,
                                color: color,
                              ),
                            ),
                            const HeartBTN(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const PriceWidget(),
                const SizedBox(height: 5),
                TextWidget(
                  title: 'Apricots',
                  textSize: 16,
                  color: color,
                  isTitle: true,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
