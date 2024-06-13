import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/size_config.dart';
import 'package:pdax_exam/presentation/widgets/alert_dialog/new_custom_alert_dialog.dart';
import 'package:pdax_exam/presentation/widgets/custom_text_style.dart';
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:pdax_exam/presentation/utility/global.dart' as global;

dialogSuccessDone(
    BuildContext context,
    String title,
    String description,
    Function onConfirmed,
    ) {

  Widget icon = Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: global.successColor,
          width: SizeConfig.safeBlockHorizontal * 1.2,
        )
    ),
    child: Padding(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
      child: Icon(
        Icons.check_rounded,
        color: global.successColor,
        size: SizeConfig.safeBlockHorizontal * 10,
      ),
    ),
  );

  Widget myTitle = Padding(
    padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 5),
    child: Text(
        title,
        style: textColored5(context, global.palette3, FontWeight.bold)
    ),
  );

  Widget myDescription = Center(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: textStyle3(context),
      ),
    ),
  );

  Widget confirmButton = GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      onConfirmed.call();
    },
    child: Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockHorizontal * 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.safeBlockHorizontal * 2,
        ),
        color: global.palette6,
      ),
      child: Center(
        child: Text(
          constants.capClose,
          style: textColored4(context, global.palette1, FontWeight.w300),
        ),
      ),
    ),
  );

  CustomDialog alert = CustomDialog(
    backgroundColor: global.palette1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    ),
    title: Center(
        child: Column(
          children: [
            icon,
            myTitle,
          ],
        )),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
        ),
        child: Column(
          children: [
            myDescription,
            SizedBox(height: SizeConfig.safeBlockHorizontal * 4),
            confirmButton,
            SizedBox(height: SizeConfig.safeBlockHorizontal * 6,),
          ],
        ),
      ),
    ],
  );
  showCustomDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


///----------------------------------ERROR-------------------------------------

////////////////////////////////////////////////////////////////////////////////

dialogErrorDone(
    BuildContext context,
    String title,
    String description,
    Function onConfirmed,
    ) {

  Widget icon = Padding(
    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
    child: Icon(
      Icons.error_outline,
      color: global.errorColor,
      size: SizeConfig.safeBlockHorizontal * 16,
    ),
  );

  Widget myTitle = Padding(
    padding: EdgeInsets.only(top: SizeConfig.safeBlockHorizontal * 5),
    child: Text(
        title,
        style: textColored5(context, global.palette3, FontWeight.bold)
    ),
  );

  Widget myDescription = Center(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: textStyle3(context),
      ),
    ),
  );

  Widget confirmButton = GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
      onConfirmed.call();
    },
    child: Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockHorizontal * 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.safeBlockHorizontal * 2,
        ),
        color: global.errorColor,
      ),
      child: Center(
        child: Text(
          constants.capClose,
          style: textColored4(context, global.palette1, FontWeight.w300),
        ),
      ),
    ),
  );

  CustomDialog alert = CustomDialog(
    backgroundColor: global.palette1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    ),
    title: Center(
        child: Column(
          children: [
            icon,
            myTitle,
          ],
        )),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
        ),
        child: Column(
          children: [
            myDescription,
            SizedBox(height: SizeConfig.safeBlockHorizontal * 4),
            confirmButton,
            SizedBox(height: SizeConfig.safeBlockHorizontal * 6,),
          ],
        ),
      ),
    ],
  );
  showCustomDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

////////////////////////////////////////////////////////////////////////////////
///---------------------------------------LOADING-------------------------------
dialogLoading(
    BuildContext context,
    String description,
    bool isDismisable,
    ) {

  Widget myDescription = Center(
    child: Text(
      description,
      textAlign: TextAlign.center,
      style: textStyle5(context),
    ),
  );

  CustomDialog alert = CustomDialog(
    backgroundColor: global.palette1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    ),
    title: Center(
        child: Text(
            constants.capLoading,
            style: textColored5(context, global.palette5, FontWeight.bold)
        )),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 12,
        ),
        child: Column(
          children: [
            myDescription,
            Padding(
              padding: EdgeInsets.all(
                  SizeConfig.safeBlockHorizontal * 4
              ),
              child: const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: global.palette3,
                  strokeWidth: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
  showCustomDialog(
    context: context,
    barrierDismissible: isDismisable,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

////////////////////////////////////////////////////////////////////////////////


