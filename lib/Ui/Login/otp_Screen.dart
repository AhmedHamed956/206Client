import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project/Ui/Login/Cubit/cubit.dart';
import 'package:project/Ui/home/home_screen.dart';
import 'package:project/Ui/navigation_Screens/main_screen.dart';

import '../../Shared/constant.dart';
import '../../components/component.dart';
import 'Cubit/states.dart';

class OtpScreen extends StatefulWidget {
  final String? phonenumber;
  const OtpScreen({super.key, this.phonenumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);

  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();

  bool loading = false;
  bool resnd = false;

  @override
  void initState() {
    startTimer();
    // _email = "himahamed999@gmail.com";
    errorController = StreamController<ErrorAnimationType>();
    // init();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      print(seconds);
      if (seconds == 431939) {
        stopTimer();
        resnd = true;
        // countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
      print(myDuration);
    });
  }

  @override
  void dispose() {
    countdownTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(1));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return BlocConsumer<LoginScreenCubit, LoginAppStates>(
      listener: (context, state) {
        // if (state is CheckBlockSuccessStates) {
        //   if (LoginScreenCubit.get(context)
        //               .checkBlockModel
        //               ?.data
        //               ?.blocked ==
        //           0 &&
        //       textEditingController.text.isNotEmpty) {

        //   } else {
        //     if (textEditingController.text.isEmpty) {
        //       showSnackBar(
        //           // title: langKey == 'ar'
        //           // ?
        //           title: "Please enter otp code"
        //           // : "The phone number you entered is incorrect");
        //           // print("error");
        //           );
        //     }
        //   }
        // }

        if (state is CheckOtpSuccessStates) {
          {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
            print('success');
            // showSnackBar(
            //     // title: langKey == 'ar'
            //     // ?
            //     title: "${LoginScreenCubit.get(context).userModel?.message}"
            //     // : "The phone number you entered is incorrect");
            //     // print("error");
            //     );
          }
        }

        if (state is CheckOtpErrorStates) {
          print('eroooor');
          showSnackBar(title: "رمز التحقق خطأ");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                "كود التفعيل",
                style: TextStyle(color: appbarTextcolor, fontSize: 20),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  color: arrowbackcolor,
                  icon: Icon(Icons.arrow_forward),
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 20),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ادخل الكود اللي راح يوصلك',
                      style: TextStyle(
                        color: boldTextcolor.withOpacity(0.9),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 34, left: 34),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      textStyle: const TextStyle(color: Colors.black),
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // obscuringWidget: FlutterLogo(size: 24),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 3) {
                      //     return "I'm from validator";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: 50,
                          fieldWidth: 60,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          disabledColor: const Color(0xffeeeeee),
                          inactiveColor: textFieldColor,
                          selectedFillColor: Colors.white,
                          activeColor: textFieldColor),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,

                      errorAnimationController: errorController,
                      // controller: textEditingController,
                      keyboardType: TextInputType.number,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadows: [
                        const BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.white,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                        print(textEditingController.text);
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                          textEditingController.text = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'تغيير',
                      style: TextStyle(
                        color: greencolor,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    widget.phonenumber == null
                        ? Text(
                            'علي الرقم',
                            style: TextStyle(
                              color: boldTextcolor.withOpacity(0.9),
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            '${widget.phonenumber}علي الرقم',
                            style: TextStyle(
                              color: boldTextcolor.withOpacity(0.9),
                              fontSize: 16,
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                resnd == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$minutes:$seconds',
                            style: TextStyle(
                              color: button1color.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'يصلك الكود في',
                            style: TextStyle(
                              color: otpTexecolor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'اعادة ارسال الكود',
                            style: TextStyle(
                              color: resendTextcolor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: state is! CheckOtpLoadingState,
                  builder: (context) => defultbutton(
                      function: () async {
                        // await LoginScreenCubit.get(context).checkBlock(
                        //   phone: widget.phonenumber.toString(),
                        // );

                        if (textEditingController.text.isNotEmpty) {
                          await LoginScreenCubit.get(context).checkOtp(
                              code: textEditingController.text,
                              fcmToken: '',
                              phone: widget.phonenumber.toString(),
                              context: context);
                        } else {
                          showSnackBar(
                              // title: langKey == 'ar'
                              // ?
                              title: "Please enter Otp code"
                              // : "The phone number you entered is incorrect");
                              // print("error");
                              );
                        }
                      },
                      text: "ابدا الان",
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
                // Container(
                //   child: defultbutton(
                //       function: () async {
                //         await LoginScreenCubit.get(context).checkOtp(
                //             code: textEditingController.text,
                //             fcmToken: '',
                //             phone: widget.phonenumber.toString(),
                //             context: context);
                //       },
                //       text: "ابدا الان",
                //       height: 58,
                //       width: MediaQuery.of(context).size.width,
                //       color: button1color,
                //       textColor: Colors.white),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
