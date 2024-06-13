import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/global.dart' as global;
import 'package:pdax_exam/presentation/utility/size_config.dart';


TextStyle textStyle1(context) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 2.7,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle2(context) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 3.06,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle3(context) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 3.6,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle4(context) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.05,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle5(context) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle6(context) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 5,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}

TextStyle textStyle7(context) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 5.4,
    color: global.textColorDark,
    letterSpacing: .5,
    fontWeight: FontWeight.normal,
  );
}


TextStyle textColored1(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 2.7,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

TextStyle textColored2(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 3.06,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

TextStyle textColored3(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 3.6,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

TextStyle textColored4(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);

  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.05,
    color: color,
    letterSpacing: 1,
    fontWeight: fontWeight,
  );
}

TextStyle textColored5(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

TextStyle textColored6(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 5,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

TextStyle textColored7(context, Color color, FontWeight fontWeight) {
  SizeConfig().init(context);
  return TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 6,
    color: color,
    letterSpacing: .5,
    fontWeight: fontWeight,
  );
}

