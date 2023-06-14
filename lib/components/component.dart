import 'dart:ui';

import 'package:flutter/material.dart';

import '../Shared/constant.dart';
import '../Ui/onBoarding_Screen.dart';
import '../main.dart';
import '../network/local/cache-helper.dart';

Widget ingridentbutton(
        {double? width,
        double? height,
        String? support,
        required String text,
        required VoidCallback function,
        required Color color1,
        required Color color2}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color2, color1])),
      child: MaterialButton(
          onPressed: function,
          child: Text(text,
              style: TextStyle(
                  color: support == 'ture' ? button1color : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400))),
    );

class CommonBtn extends StatelessWidget {
  double? width = 0;
  String text = "";
  Function? onTap;

  CommonBtn({this.width, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [button2color, button1color])),
        child: MaterialButton(
            onPressed: () => onTap!(),
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400))));
  }
}

Widget defultbutton({
  double? width,
  double? height,
  String? text,
  Color? textColor,
  required VoidCallback function,
  Color? color,
}) =>
    Container(
      width: width,
      height: height,

      // ignore: sort_child_properties_last
      child: MaterialButton(
          onPressed: function,
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 17),
          )),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(14), color: color),
    );

Widget defaulttextfield(
        {required TextEditingController controller,
        required TextInputType type,
        bool? ispromocode,
        bool isQuickSearch = false,
        bool isPassword = false,
        VoidCallback? ontap,
        ValueChanged? onsmuit,
        ValueChanged? onchanged,
        Function? validator,
        String? label,
        context,
        bool? vaild,
        String? hinttext,
        String? promecode,
        int? shopid,
        IconData? prefix,
        IconData? suffix,
        Color? iconColor,
        VoidCallback? suffixpressed,
        double? fontsize,
        Color? fontColor}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsmuit,
      onChanged: onchanged,
      onTap: ontap,

      // validator: validator,

      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
              fontSize: fontsize,
              color: hinitTextColor,
              fontWeight: FontWeight.w500),
          labelText: label,
          enabled: vaild == true ? false : true,
          prefixIcon: Icon(
            prefix,
            color: iconColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: textFieldColor))),
    );

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text('A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSnackBar({required String title}) {
  gloScaffMessKey.currentState?.hideCurrentSnackBar();
  gloScaffMessKey.currentState?.clearSnackBars();
  gloScaffMessKey.currentState?.showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(title)));
}

void sginOut(context) async {
  // await storage.delete(key: "myLocation");
  // await storage.delete(key: "myAddress");

  CacheHelper.removeData(key: 'token').then((value) {
    CacheHelper.removeData(key: 'userId').then((value) {}).then((value) {
      CacheHelper.removeData(key: 'mycity').then((value) {}).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      });
    });
  });
}
