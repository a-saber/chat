import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void NavigateTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void NavigateAndFinish(context, Widget widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
Widget formField({
  int index = 2,
  required TextEditingController controller,
  required String hint,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    );
Widget defaultFromField({
  required TextEditingController controller,
  void Function()? SuffixPressed,
  required TextInputType type,
  bool isPassword = false,
  void Function(String)? onSubmit,
  required String hintText,
  required IconData prefix,
  IconData? suffix,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(27, 95, 255, .3),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        validator: (String? value) {
          if (value.toString().isEmpty || value == null) {
            return "Mustn't Be Empty";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: SuffixPressed,
                )
              : null,
          prefixIcon: Icon(prefix),
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String title = '',
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: actions,
    );
void showToast({
  required String massage,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget defaultButton({
  bool isUpperCase = true,
  double width = double.infinity,
  Color backgroundcolor = Colors.blue,
  double raduis = 0.0,
  double height = 40.0,
  required void Function()? onPressed,
  String text = '',
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: backgroundcolor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
