import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/Login/login_Screen.dart';
import 'package:project/components/component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? logo;
  final String? title;
  final String? image;
  BoardingModel({this.logo, this.title, this.image});
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'عيش جوا البقالة وتصفح المنتجات بمكالمة فيديو ,فون , شات',
        image: "assets/images/boarding1.png"),
    BoardingModel(
        title: 'يتم تحضير طلبك من فريق العمل في البقالة لكي يصلك بسهولة',
        image: "assets/images/boarding2.png"),
    BoardingModel(
        title: 'يصلك مندوب البقالة بطلبك في اسرع وقت',
        image: "assets/images/boarding3.png")
  ];

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              );
            },
            child: Text(
              'تخطي',
              style: TextStyle(color: skipColor, fontSize: 16),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  width: 100,
                  child: Image.asset("assets/images/206_Logo.png")),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
              controller: boardController,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          SmoothPageIndicator(
            controller: boardController,
            count: boarding.length,
            effect: const ExpandingDotsEffect(
                dotColor: dotColor,
                activeDotColor: button1color,
                dotHeight: 6,
                expansionFactor: 4,
                dotWidth: 6,
                spacing: 5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 65),
            child: Container(
              child: defultbutton(
                  function: () {
                    if (isLast) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ),
                      );
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  text: "التالي",
                  height: 58,
                  width: MediaQuery.of(context).size.width,
                  color: button1color,
                  textColor: Colors.white),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  '${model.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: boardingText, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 225,
                child: Image.asset("${model.image}"),
              )
            ],
          ),
        ],
      );
}
