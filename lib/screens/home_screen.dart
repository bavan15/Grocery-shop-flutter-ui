import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/provider/dark_theme_provider.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/feed_items.dart';
import 'package:grocery_app_course/widgets/on_sale_widget.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImage = [
    'assets/images/offers/Offer1.jpg',
    'assets/images/offers/Offer2.jpg',
    'assets/images/offers/Offer3.jpg',
    'assets/images/offers/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = utils.color;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImage[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _offerImage.length,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                    activeSize: 12,
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {},
              child: TextWidget(
                title: 'View all',
                textSize: 20,
                color: Colors.blue,
              ),
            ),
            Row(
              children: <Widget>[
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: <Widget>[
                      TextWidget(
                        title: 'On sale'.toUpperCase(),
                        textSize: 22,
                        color: Colors.red,
                        isTitle: true,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  TextWidget(
                    title: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      title: 'Browse all',
                      textSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: size.width / (size.height * 0.60),
              children: List.generate(4, (index) => const FeedsWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
