
import 'package:flutter/cupertino.dart';

import 'dimensions.dart';

class BigText extends StatelessWidget {

  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key,
    this.color,
    required this.text,
    this.size =0,
    this.overFlow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:1,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
    );
  }
}
