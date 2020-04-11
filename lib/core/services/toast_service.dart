import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService{
  void showToast({ @required String msg}){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
    );
  }
}