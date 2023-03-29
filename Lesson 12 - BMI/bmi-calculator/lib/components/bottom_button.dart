import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function ontap;

  BottomButton({@required this.title, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: kBottomButtonBackgroundColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
