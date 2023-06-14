import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/Login/Cubit/cubit.dart';
import 'package:project/Ui/Login/Cubit/states.dart';
import 'package:project/Ui/home/Cubit.dart';
import 'package:project/Ui/home/states.dart';
import 'package:project/Ui/navigation_Screens/Setting_screen.dart';
import 'package:project/Ui/navigation_Screens/wallet_Screen.dart';

import '../../components/component.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final Color background = Colors.grey;
    final Color fill = Colors.redAccent;
    final Color fillS = Colors.blue;

    final List<Color> gradient = [
      fill,
      background,
      fill,
      fillS,
    ];
    final double fillPercent = 56.23; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return BlocConsumer<LoginScreenCubit, LoginAppStates>(
      listener: (context, state) {
        if (state is ShopLogOutSuccessStates) {
          sginOut(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: favouteIconColor,
          body: Column(
            children: [
              Container(
                // color: Colors.white,
                child: Column(children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        alignment: Alignment.topCenter,
                        height: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(30, 8),
                            bottomRight: Radius.elliptical(30, 8),
                          ),
                          color: button1color,
                        ),
                        //child: Image.asset("assets/bgImage.jpg"),
                      ),
                      Container(
                          //color: Colors.white,
                          // width: 400.0,

                          padding:
                              EdgeInsets.only(top: 200, left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 19,
                                horizontal: 32,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WalletScreen()),
                                          );
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          child: Image.asset(
                                            'assets/images/Wallet.png',
                                            width: 25,
                                            height: 25,
                                            color: button1color,
                                          ),
                                          // height: 40,
                                          // width: 40,
                                          decoration: BoxDecoration(
                                              color: accountItemsColors
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'المحفظة',
                                        style: TextStyle(
                                            color: accountTextColor,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          'assets/images/star.png',
                                          width: 25,
                                          height: 25,
                                          color: button1color,
                                        ),
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: accountItemsColors
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'النقاط',
                                        style: TextStyle(
                                            color: accountTextColor,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: accountItemsColors
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset(
                                          'assets/images/myOrder.png',
                                          width: 25,
                                          height: 25,
                                          color: button1color,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'الطلبات',
                                        style: TextStyle(
                                            color: accountTextColor,
                                            fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                        color: Colors.white,
                        // elevation: 6.0,
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/acc1.png',
                                      // width: 15,
                                      // height: 15,
                                      color: button1color,
                                    ),
                                    // height: 40,
                                    // width: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            accountItemsColors.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'حسابي',
                                    style: TextStyle(
                                        color: accountItemsListColors,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: boardingText,
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/acc2.png',
                                      // width: 15,
                                      // height: 15,
                                      color: button1color,
                                    ),
                                    // height: 40,
                                    // width: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            accountItemsColors.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'عناويني',
                                    style: TextStyle(
                                        color: accountItemsListColors,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: boardingText,
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            // Container(
                            //   height: 50,
                            //   color: Colors.amber[500],
                            //   child: const Center(child: Text('Entry B')),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingScreen()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                        'assets/images/acc3.png',
                                        // width: 15,
                                        // height: 15,
                                        color: button1color,
                                      ),
                                      // height: 40,
                                      // width: 40,
                                      decoration: BoxDecoration(
                                          color: accountItemsColors
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      'الاعدادات',
                                      style: TextStyle(
                                          color: accountItemsListColors,
                                          fontSize: 15),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: boardingText,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/acc4.png',
                                      // width: 15,
                                      // height: 15,
                                      color: button1color,
                                    ),
                                    // height: 40,
                                    // width: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            accountItemsColors.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'مساعدة',
                                    style: TextStyle(
                                        color: accountItemsListColors,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: boardingText,
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/Log out.png',
                                      // width: 15,
                                      // height: 15,
                                      color: button1color,
                                    ),
                                    // height: 40,
                                    // width: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            accountItemsColors.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'خروج',
                                    style: TextStyle(
                                        color: accountItemsListColors,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    color: boardingText,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                    onPressed: () async {
                                      await LoginScreenCubit.get(context)
                                          .userlogOut();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
