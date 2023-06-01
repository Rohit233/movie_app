import 'package:flutter/material.dart';
import 'package:movie_app/enums/snack_bar_type_enum.dart';

class BasicUtil {
  //* SHOW SNACK BAR FUN
  static showSnackBar(BuildContext context, String msg, SnackBarType? type) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
        backgroundColor: type ==  SnackBarType.SUCCESS
            ? Colors.greenAccent
            : type == SnackBarType.ERROR
                ? Colors.redAccent
                : null,
        content: Text(msg)));
  }

//* OPEN BOTTOM SHEET
  static openBottomSheet(context,Widget child) {
  return showModalBottomSheet(
      useRootNavigator: true ,
      isScrollControlled:  true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0))),
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: child,
        );
      });
  }
}