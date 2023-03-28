import 'package:flutter/material.dart';
import 'package:grocery_app_course/provider/dark_theme_provider.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {required this.catText,
      required this.imgPath,
      required this.passedColor,
      Key? key})
      : super(key: key);

  final String catText, imgPath;
  final Color passedColor;

  @override
  Widget build(BuildContext context) {
    final themeState = context.read<DarkThemeProvider>();
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('category item is pressed;');
      },
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: passedColor.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: <Widget>[
            // image of category
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // title of category
            TextWidget(
              title: catText,
              textSize: 20,
              color: color,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}
