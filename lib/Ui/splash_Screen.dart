import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/home/home_screen.dart';
import 'package:project/Ui/onBoarding_Screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<Offset>(
      begin: Offset(0.0, 0.9),
      end: Offset.zero,
    ).animate(_animationController!);
    _animationController?.forward().whenComplete(() {
      // when animation completes, put your code here
    });
  }

  @override
  void didChangeDependencies() {
    //Future<User?> user =

    Timer(Duration(seconds: 4), () {
      if (token == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen()));
      }
      if (token != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
      // => user==null?
      //       RegisterScreen():
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Positioned(
            top: height * 0.35,
            left: width * 0.1,
            child: SlideTransition(
              position: _animation!,
              child: AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                duration: Duration(seconds: 0),
                child: Image(
                  height: height * 0.2,
                  width: width * 0.8,
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/206_Logo.png"),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: width*0.6,
          //         child: TextLiquidFill(
          //           text: 'Game Station',
          //           waveColor: appColor,
          //           waveDuration: Duration(seconds: 2),
          //           boxBackgroundColor: Colors.white,
          //           textStyle: TextStyle(
          //               fontSize: width*0.07+2,
          //               fontWeight: FontWeight.bold,
          //               color: colorWhite
          //           ),
          //           boxHeight: height*0.09,
          //         ),
          //       ),
          //       SizedBox(height: height*0.03,),
          //       Container(
          //         width: width*0.6,
          //         alignment: Alignment.center,
          //         child: DefaultTextStyle(
          //           style: const TextStyle(
          //             fontSize: 16.0,
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //           child: AnimatedTextKit(
          //             animatedTexts: [
          //               WavyAnimatedText('Never Play Alone'),
          //             ],
          //             isRepeatingAnimation: false,
          //             onTap: () {
          //               print("Tap Event");
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      )),
    );
  }
}
