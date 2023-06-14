// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:project/Shared/constant.dart';
// import 'dart:math' as math;

// import '../../widgets/appBrain.dart';

// final String localUserID = math.Random().nextInt(10000).toString();

// class MarketCall extends StatefulWidget {
//   const MarketCall({super.key});

//   @override
//   State<MarketCall> createState() => _MarketCallState();
// }

// class _MarketCallState extends State<MarketCall> {
//   int index = 0;
//   @override
//   void initState() {
//     index == 0;
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: ClipRRect(
//               child: ImageFiltered(
//                 imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Image.network(
//                   'https://images.unsplash.com/photo-1672162724304-866bd48a3d6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: InkWell(
//             onTap: () {
//               setState(() {
//                 //   if (index == null) {
//                 index = 1;
//                 //    }
//               });
//             },
//             child: Container(
//               child: CircleAvatar(
//                 radius: 100,
//                 backgroundImage: NetworkImage(
//                   'https://images.unsplash.com/photo-1672162724304-866bd48a3d6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Stack(
//               children: [
//                 index == 0
//                     ? Container(
//                         decoration: const BoxDecoration(
//                             color: button1color,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(25),
//                                 topRight: Radius.circular(25))),
//                         width: MediaQuery.of(context).size.width,
//                         height: 180.0,

//                         alignment:
//                             Alignment.center, // where to position the child
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             // index == 0
//                             // ?
//                             Container(
//                               decoration: const BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(25),
//                                       topRight: Radius.circular(25))),
//                               width: MediaQuery.of(context).size.width,
//                               height: 99.0,
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'في انتظار تفاصيل الفاتوره',
//                                       style: TextStyle(
//                                           color: button1color,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                                     )
//                                   ]),
//                             )
//                           ],
//                         ),
//                       )
//                     : index == 1
//                         ? Container(
//                             decoration: const BoxDecoration(
//                                 color: button1color,
//                                 borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(25),
//                                     topRight: Radius.circular(25))),
//                             width: MediaQuery.of(context).size.width,
//                             height: 350.0,

//                             alignment:
//                                 Alignment.center, // where to position the child
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(25),
//                                           topRight: Radius.circular(25))),
//                                   width: MediaQuery.of(context).size.width,
//                                   height: 267.0,
//                                   child: Column(children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 20, left: 20, right: 20),
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             border:
//                                                 Border.all(color: border2Color),
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: Center(
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 14, vertical: 15),
//                                             child: Row(
//                                               children: [
//                                                 Image.asset(
//                                                     'assets/images/focus (1).png'),
//                                                 Spacer(),
//                                                 Text('تفاصيل الفاتورة',
//                                                     style: TextStyle(
//                                                       color: appbarTextcolor,
//                                                       fontSize: 14,
//                                                     )),
//                                                 SizedBox(
//                                                   width: 12,
//                                                 ),
//                                                 Container(
//                                                   height: 46,
//                                                   width: 46,
//                                                   decoration: BoxDecoration(
//                                                     color: circleColor,
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: Image.asset(
//                                                       'assets/images/invoice-_1_.png'),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 14, right: 20, left: 20),
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             border:
//                                                 Border.all(color: border2Color),
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: Center(
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 14, vertical: 15),
//                                             child: Row(
//                                               children: [
//                                                 Text('30.90 ر.س',
//                                                     style: TextStyle(
//                                                       color: button1color,
//                                                       fontSize: 16,
//                                                     )),
//                                                 Spacer(),
//                                                 Text('الاجمالي',
//                                                     style: TextStyle(
//                                                       color: appbarTextcolor,
//                                                       fontSize: 14,
//                                                     )),
//                                                 // SizedBox(
//                                                 //   width: 12,
//                                                 // ),
//                                                 // Container(
//                                                 //   height: 46,
//                                                 //   width: 46,
//                                                 //   decoration: BoxDecoration(
//                                                 //     color: circleColor,
//                                                 //     shape: BoxShape.circle,
//                                                 //   ),
//                                                 //   child: Image.asset(
//                                                 //       'assets/images/invoice-_1_.png'),
//                                                 // ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 16),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                             height: 56,
//                                             width: 159,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(16),
//                                                 color: greenAcceptcolor),
//                                             child: Center(
//                                               child: Text(
//                                                 "قبول",
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: 17,
//                                           ),
//                                           Container(
//                                             height: 56,
//                                             width: 159,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(16),
//                                                 color: redRefusedcolor),
//                                             child: Center(
//                                               child: Text(
//                                                 "رفص",
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ]),
//                                 )
//                               ],
//                             ),
//                           )
//                         : Container(),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                   child: Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 42,
//                           width: 42,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Icon(
//                             Icons.chat,
//                             color: button1color,
//                           ),
//                         ),
//                         Container(
//                             // height: 42,
//                             // width: 42,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                                 child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 14, vertical: 7),
//                               child: Text(
//                                 "24:50",
//                                 style: TextStyle(color: button1color),
//                               ),
//                             ))),
//                         Container(
//                           height: 45,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: cancelButtonColor,
//                           ),
//                           child: Icon(
//                             Icons.call_end,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
