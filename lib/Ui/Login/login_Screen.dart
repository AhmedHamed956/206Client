import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/components/component.dart';

import '../../Shared/constant.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';
import 'otp_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool _validate = false;
  bool? _phonevalidate;

  bool? limit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginAppStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessStates) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        phonenumber: phoneController.text,
                      )),
            );
            if (state is ShopLoginErrorStates) {}
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 60,
                          width: 100,
                          child: Image.asset("assets/images/206_Logo.png")),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '!مرحبا بك',
                        style: TextStyle(
                            color: boldTextcolor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ادخل رقم جوال يا الحبيب',
                        style: TextStyle(
                            color: boldTextcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'رقم الجوال',
                        style: TextStyle(
                          color: boardingText,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  // Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child: defaulttextfield(
                  //       controller: phoneController,
                  //       type: TextInputType.phone,
                  //       hinttext: 'ادخل رقم الجوال',
                  //       fontColor: textFieldColor),
                  // ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: (value) {
                        String result = value;
                        // Here replace 4 by your maxLength value
                        if (result.length > 9) {
                          result = result.substring(0, 9);
                        }
                        if (result.length == 9) {
                          setState(() {
                            _phonevalidate = true;
                            limit = true;
                          });
                        }
                        if (result.length < 9) {
                          setState(() {
                            _phonevalidate = false;
                            limit = false;
                          });
                        }
                        phoneController.text = result;
                        phoneController.selection = TextSelection.fromPosition(
                          TextPosition(offset: result.length),
                        );
                      },
                      decoration: InputDecoration(
                          errorText: _validate
                              // ? langKey == 'ar'
                              //     ? 'برجاء ادخال رقم الهاتف'
                              // :
                              ? "please enter your phone number"
                              : null,
                          prefixText: '+966 ',
                          // suffixText: langKey == 'ar' ? ' 966+' : "",
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'ادخل رقم الجوال',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: textFieldColor))),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ConditionalBuilder(
                    condition: state is! ShopLoginLoadingState,
                    builder: (context) => defultbutton(
                        function: () async {
                          if (phoneController.text.isNotEmpty &&
                              _phonevalidate == true) {
                            await LoginScreenCubit.get(context)
                                .userlogin(phone: phoneController.text);
                          } else {
                            showSnackBar(
                                // title: langKey == 'ar'
                                // ?
                                title:
                                    "The phone number you entered is incorrect"
                                // : "The phone number you entered is incorrect");
                                // print("error");
                                );
                          }
                          if (phoneController.text.isEmpty) {
                            showSnackBar(
                                // title: langKey == 'ar'
                                // ?
                                title: "Please enter your phone number"
                                // : "The phone number you entered is incorrect");
                                // print("error");
                                );
                          }
                        },
                        text: "التالي",
                        height: 58,
                        width: MediaQuery.of(context).size.width,
                        color: button1color,
                        textColor: Colors.white),
                    fallback: (context) => Container(
                        child: Center(
                            child: CircularProgressIndicator(
                      color: button1color,
                    ))),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
