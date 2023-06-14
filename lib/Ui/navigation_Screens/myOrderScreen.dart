import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:hexcolor/hexcolor.dart';

import '../../Shared/constant.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            child: Center(child: Image.asset('assets/images/Search.png')),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: searchCirclecolor),
          ),
        ),
        title: Text(
          'طلباتي',
          style: TextStyle(
            color: appbarTextcolor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 70, //<--- This is what's causing the issue
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: button1color,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
                //bottomLeft: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 21),
              child: Container(
                child: TabBar(
                  controller: _tabController,
                  // indicatorPadding: EdgeInsets.all(30),
                  // indicatorSize: TabBarIndicatorSize.tab,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Colors.white,
                  ),
                  labelColor: button1color,
                  unselectedLabelColor: Colors.white,

                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'الحالية',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'المكتملة',
                    ),
                    Tab(
                      text: 'الملغية',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: button1color,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height - 249,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: orderContainerColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 213,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      'order number:',
                                      style: TextStyle(
                                        color: arrowbackcolor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '#5728110',
                                      style: TextStyle(
                                        color: orderNumberColor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 88,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: purpleColor,
                                          borderRadius:
                                              BorderRadius.circular(19)),
                                      child: Center(
                                        child: Text(
                                          "طلب حالي",
                                          style: TextStyle(
                                            color: button1color,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: rateColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'بقالة الرياض',
                                          style: TextStyle(
                                            color: appbarTitleColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'اليوم , 10.30:وقت الطلب',
                                          style: TextStyle(
                                            color: arrowbackcolor,
                                            fontSize: 12,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade100
                                              .withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Icon(
                                          Icons.call_outlined,
                                          color: Colors.green,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      '150 SAR:السعر',
                                      style: TextStyle(
                                        color: priceColor,
                                        fontSize: 16,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: button1color,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Text(
                                          'تتبع الطلب',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),

                  // second tab bar view widget
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 213,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      'order number:',
                                      style: TextStyle(
                                        color: arrowbackcolor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '#5728110',
                                      style: TextStyle(
                                        color: orderNumberColor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 88,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: quickcolor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(19)),
                                      child: Center(
                                        child: Text(
                                          "طلب مكتمل",
                                          style: TextStyle(
                                            color: completeTextcolor,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: rateColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'بقالة الرياض',
                                          style: TextStyle(
                                            color: appbarTitleColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'اليوم , 10.30:وقت الطلب',
                                          style: TextStyle(
                                            color: arrowbackcolor,
                                            fontSize: 12,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    // Spacer(),
                                    // Container(
                                    //   height: 35,
                                    //   width: 35,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.blue.shade100
                                    //           .withOpacity(0.5),
                                    //       shape: BoxShape.circle),
                                    //   child: Center(
                                    //     child: Icon(
                                    //       Icons.call_outlined,
                                    //       color: Colors.green,
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      '150 SAR:السعر',
                                      style: TextStyle(
                                        color: priceColor,
                                        fontSize: 16,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: button1color,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: Text(
                                          'قييم الطلب',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 213,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      'order number:',
                                      style: TextStyle(
                                        color: arrowbackcolor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '#5728110',
                                      style: TextStyle(
                                        color: orderNumberColor,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 88,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color:
                                              cancelTextcolor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(19)),
                                      child: Center(
                                        child: Text(
                                          "طلب ملغي",
                                          style: TextStyle(
                                            color: cancelTTextcolor,
                                            fontSize: 13,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: rateColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'بقالة الرياض',
                                          style: TextStyle(
                                            color: appbarTitleColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'اليوم , 10.30:وقت الطلب',
                                          style: TextStyle(
                                            color: arrowbackcolor,
                                            fontSize: 12,
                                            // fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    // Spacer(),
                                    // Container(
                                    //   height: 35,
                                    //   width: 35,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.blue.shade100
                                    //           .withOpacity(0.5),
                                    //       shape: BoxShape.circle),
                                    //   child: Center(
                                    //     child: Icon(
                                    //       Icons.call_outlined,
                                    //       color: Colors.green,
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      '150 SAR:السعر',
                                      style: TextStyle(
                                        color: priceColor,
                                        fontSize: 16,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    // Spacer(),
                                    // Container(
                                    //   height: 35,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       color: button1color,
                                    //       borderRadius:
                                    //           BorderRadius.circular(12)),
                                    //   child: Center(
                                    //     child: Text(
                                    //       'قييم الطلب',
                                    //       style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 15,
                                    //         // fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Stack(
      //       children: [
      //         // Container(
      //         //   decoration: const BoxDecoration(
      //         //       color: button1color,
      //         //       borderRadius: BorderRadius.only(
      //         //           topLeft: Radius.circular(25),
      //         //           topRight: Radius.circular(25))),
      //         //   width: MediaQuery.of(context).size.width,
      //         //   // height: 180.0,

      //         //   alignment: Alignment.center, // where to position the child
      //         //   child: Column(
      //         //     mainAxisAlignment: MainAxisAlignment.end,
      //         //     children: [
      //         //       // index == 0
      //         //       // ?
      //         //       // Container(
      //         //       //   decoration: const BoxDecoration(
      //         //       //       color: Colors.redAccent,
      //         //       //       borderRadius: BorderRadius.only(
      //         //       //           topLeft: Radius.circular(25),
      //         //       //           topRight: Radius.circular(25))),
      //         //       //   width: MediaQuery.of(context).size.width,
      //         //       //   height: 99.0,
      //         //       //   child: Row(
      //         //       //       mainAxisAlignment: MainAxisAlignment.center,
      //         //       //       children: [
      //         //       //         Text(
      //         //       //           'في انتظار تفاصيل الفاتوره',
      //         //       //           style: TextStyle(
      //         //       //               color: button1color,
      //         //       //               fontSize: 16,
      //         //       //               fontWeight: FontWeight.w500),
      //         //       //         )
      //         //       //       ]),
      //         //       // ),
      //         //     ],
      //         //   ),
      //         // ),
      //         Container(
      //           decoration: const BoxDecoration(
      //               color: Colors.black,
      //               borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(25),
      //                   topRight: Radius.circular(25))),
      //           width: MediaQuery.of(context).size.width,
      //           height: 99.0,
      //           child:
      //               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //             // Text(
      //             //   'في انتظار تفاصيل الفاتوره',
      //             //   style: TextStyle(
      //             //       color: button1color,
      //             //       fontSize: 16,
      //             //       fontWeight: FontWeight.w500),
      //             // )
      //           ]),
      //         ),
      //         Padding(
      //           padding:
      //               const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      //           child: Container(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   height: 42,
      //                   width: 42,
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(10)),
      //                   child: Icon(
      //                     Icons.chat,
      //                     color: button1color,
      //                   ),
      //                 ),
      //                 Container(
      //                     // height: 42,
      //                     // width: 42,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         borderRadius: BorderRadius.circular(10)),
      //                     child: Center(
      //                         child: Padding(
      //                       padding: const EdgeInsets.symmetric(
      //                           horizontal: 14, vertical: 7),
      //                       child: Text(
      //                         "24:50",
      //                         style: TextStyle(color: button1color),
      //                       ),
      //                     ))),
      //                 Container(
      //                   height: 45,
      //                   width: 45,
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     color: cancelButtonColor,
      //                   ),
      //                   child: Icon(
      //                     Icons.call_end,
      //                     color: Colors.white,
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //     Container(
      //       decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(25),
      //               topRight: Radius.circular(25))),
      //       width: MediaQuery.of(context).size.width,
      //       height: 99.0,
      //       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //         Text(
      //           'في انتظار تفاصيل الفاتوره',
      //           style: TextStyle(
      //               color: button1color,
      //               fontSize: 16,
      //               fontWeight: FontWeight.w500),
      //         )
      //       ]),
      //     ),
      //   ],
      // ),
    );
  }
}
