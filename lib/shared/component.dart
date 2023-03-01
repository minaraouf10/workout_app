import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastState state
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: chosseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState {SUCCESS,ERROR,WARRING}

Color chosseToastColor (ToastState state){
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color =Colors.green;
      break;
    case ToastState.ERROR:
      color =Colors.red;
      break;
    case ToastState.WARRING:
      color =Colors.amber;
      break;
  }

  return color;
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);

Widget defaultTextButton({
  required VoidCallback? function,
  required String? text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text!.toUpperCase()),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );

Widget defaultFormField(
    {required TextEditingController controller,
      required TextInputType type,
      bool isPassword = false,
      ValueChanged<String>? onSbmitted,
      ValueChanged<String>? onChanged,
      GestureTapCallback? onTap,
      required FormFieldValidator<String>? validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      VoidCallback? suffixPressed,
      bool isClickable = true}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSbmitted,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
      ),
    );