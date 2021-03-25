//theme and colors
import '../theme/theme.dart';

//pub and core package

import 'package:flutter/material.dart';

Widget backGroundImage({
  BuildContext ctx,
}) {
  return Image.asset(
    "assets/images/background_image.png",
    width: MediaQuery.of(ctx).size.width,
    height: MediaQuery.of(ctx).size.height * 0.75,
    fit: BoxFit.cover,
  );
}

Widget roundedButtonContainer({
  BuildContext ctx,
  Widget childWidget,
  Color usedColor,
  double widthFactor = .8,
  double heightFactor = .07,
  double radiusValue = 40,
}) {
  return Container(
    width: MediaQuery.of(ctx).size.width * widthFactor,
    height: MediaQuery.of(ctx).size.height * heightFactor,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(radiusValue),
      ),
      color: usedColor,
    ),
    child: Center(child: childWidget),
  );
}

Widget roundedTextContainer({
  BuildContext ctx,
  Color usedColor,
  double widthFactor = .8,
  TextEditingController controller,
  String hintTxt,
}) {
  return Container(
    width: MediaQuery.of(ctx).size.width * widthFactor,
    height: MediaQuery.of(ctx).size.height * .07,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      color: usedColor,
    ),
    child: Center(
      child: TextField(
        //controller
        controller: controller,
        decoration: InputDecoration(
          //text hint
          hintText: hintTxt,
          hintStyle: TextStyle(
            color: CustomColors.titleBlackColor,
            fontWeight: FontWeight.w500,
          ),
          //edit color and shap of text
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget giveHeightSpace({
  BuildContext ctx,
  double heightFactor = .05,
}) {
  return SizedBox(
    height: MediaQuery.of(ctx).size.height * heightFactor,
  );
}

Widget giveWidthSpace({
  BuildContext ctx,
  double widthFactor = .05,
}) {
  return SizedBox(
    width: MediaQuery.of(ctx).size.height * widthFactor,
  );
}
