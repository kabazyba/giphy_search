import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {

  static void showMessage({@required String message, Color color = Colors.red}) {
    Fluttertoast.showToast(msg: message, textColor: Colors.white,
        timeInSecForIosWeb: 3,
        backgroundColor: color,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER);
  }
}