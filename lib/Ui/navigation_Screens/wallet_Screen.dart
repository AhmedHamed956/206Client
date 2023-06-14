import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/Ui/navigation_Screens/Setting_screen.dart';

import '../../Shared/constant.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: appbarTextcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "المحفظة",
          style: TextStyle(color: appbarTextcolor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 174,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xAFF7125F2),
                          Color(0xAFF890098),
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'الرصيد بالمحفظة',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text('550 ر.س',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'اضافة رصيد',
                          style: TextStyle(fontSize: 16, color: button1color),
                        ),
                      )),
                    )
                  ],
                ),
                // elevation: 6.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                // width: 200.0,
                height: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: containerborderColor)),

                alignment:
                    Alignment.bottomCenter, // where to position the child
                child: Container(
                  // width: 50.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: containerborderColor)),
                  child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 15),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 43,
                              width: 43,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                            ),
                            Text('aaaa'),
                            Text('bbbb'),
                            Text('cccc'),
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
