import 'package:flutter/material.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: <Widget>[
          TextWidget(
            title: '1.59\$',
            textSize: 22,
            color: Colors.green,
          ),
          const SizedBox(width: 5),
          Text(
            '2.59\$',
            style: TextStyle(
              fontSize: 15,
              color: color,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
