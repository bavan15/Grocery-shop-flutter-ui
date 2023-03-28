import 'package:flutter/material.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/categories_widget.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColor = const [
    Color(0xff53B175),
    Color(0xffF8A44C),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/cat/fruits.png', 'catText': 'Fruits'},
    {'imgPath': 'assets/images/cat/grains.png', 'catText': 'Grains'},
    {'imgPath': 'assets/images/cat/nuts.png', 'catText': 'Nuts'},
    {'imgPath': 'assets/images/cat/spices.png', 'catText': 'Spices'},
    {'imgPath': 'assets/images/cat/Spinach.png', 'catText': 'Spinach'},
    {'imgPath': 'assets/images/cat/veg.png', 'catText': 'Veg'},
  ];

  @override
  Widget build(BuildContext context) {
    print('value is ${gridColor[0]}');
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          title: 'Categories',
          textSize: 24,
          color: color,
          isTitle: true,
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 240 / 250,
        children: List.generate(6, (index) {
          return CategoriesWidget(
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
            passedColor: gridColor[index],
          );
        }),
      ),
    );
  }
}
