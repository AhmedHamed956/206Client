// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';

// import '../../../../../../generated/l10n.dart';
// import '../../../../../common/global.dart';
// import '../../../../../common/route_argument.dart';
// import '../../../../Home/Cubit.dart';
// import '../../../../Home/states.dart';
// import '../../../../Shared/constant.dart';
// import '../../../../components/appar.dart';
// import '../../../../components/component.dart';
// import '../../../main-screens/Quick-Screens/qucik_filter.dart';
// import '../../constants/size_constants.dart';

// class Chatbot extends StatefulWidget {
//   final int? index;

//   const Chatbot({super.key, this.index});

//   @override
//   State<Chatbot> createState() => _ChatbotState();
// }

// class _ChatbotState extends State<Chatbot> {
//   bool? chatBot;
//   bool? check1;

//   bool? check2;

//   bool? check3;

//   bool? check4;

//   bool? check5;
//   int? r1;
//   int? r2;

//   int? r3;

//   int? r4;

//   int? r5;

//   int? index;
//   int? select;
//   int? select2;

//   Color _containerColor1 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor2 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor3 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor4 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor5 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor6 = buttonLightcolor.withOpacity(0.5);
//   Color _containerColor7 = buttonLightcolor.withOpacity(0.5);

//   Color _textColor1 = button1color;
//   Color _textColor2 = button1color;
//   Color _textColor3 = button1color;
//   Color _textColor4 = button1color;
//   Color _textColor5 = button1color;
//   Color _textColor6 = button1color;
//   Color _textColor7 = button1color;

//   var model;
//   @override
//   void initState() {
//     super.initState();
//     if (widget.index != null) {
//       index = widget.index;
//     } else {
//       index = 1;
//     }
//     chatBot = true;
//     // homeCubit = BlocProvider.of<HomeCubit>(context);
//     // homeCubit .getFilterQuickData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..getFilterQuickData(),
//       child: BlocConsumer<HomeCubit, HomeAppState>(
//         listener: (context, state) {
//           if (state is GetQuickFilterSuccessStates) {
//             model = HomeCubit.get(context).quickFilterModel;
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//               appBar: AppBarWidget(label: ""),
//               body: SingleChildScrollView(
//                 child: SafeArea(
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: Sizes.dimen_8),
//                         child: Column(children: [
//                           Stack(
//                             children: [
//                               chatBot == true
//                                   ? Align(
//                                       child: index! <= 1
//                                           ? Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 30),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10),
//                                                     border: Border.all(
//                                                         color: button1color)),
//                                                 child: Container(
//                                                   height: 130,
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   child: Column(children: [
//                                                     Flexible(
//                                                         child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         'مرحبًا عزيزي ${username} ! كيف يمكننا مساعدتك؟',
//                                                         style: TextStyle(
//                                                             color: textColor,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       ),
//                                                     )),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           // _containerHeight = 400;
//                                                           _containerColor2 =
//                                                               buttonLightcolor
//                                                                   .withOpacity(
//                                                                       0.5);
//                                                           _textColor2 =
//                                                               button1color;
//                                                           _containerColor1 =
//                                                               button1color;
//                                                           _textColor1 =
//                                                               Colors.white;
//                                                           index = 2;
//                                                         });
//                                                       },
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .symmetric(
//                                                                 horizontal: 15,
//                                                                 vertical: 10),
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                                   _containerColor1,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           width: 150,
//                                                           height: 30,
//                                                           child: Center(
//                                                               child: Text(
//                                                             langKey == "ar"
//                                                                 ? "طلب سريع"
//                                                                 : "quick order",
//                                                             style: TextStyle(
//                                                                 color:
//                                                                     _textColor1),
//                                                           )),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           // _containerHeight = 400;
//                                                           _containerColor1 =
//                                                               buttonLightcolor
//                                                                   .withOpacity(
//                                                                       0.5);
//                                                           _textColor1 =
//                                                               button1color;
//                                                           _containerColor2 =
//                                                               button1color;
//                                                           _textColor2 =
//                                                               Colors.white;
//                                                         });
//                                                         List<String> data = [
//                                                           "999999999",
//                                                           "رسالة جديدة من الدعم",
//                                                           ''
//                                                         ];
//                                                         Navigator.pushNamed(
//                                                             context,
//                                                             ChatCycle.routeName,
//                                                             arguments:
//                                                                 RouteArgument(
//                                                                     param:
//                                                                         data));
//                                                       },
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .symmetric(
//                                                                 horizontal: 15,
//                                                                 vertical: 10),
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                                   _containerColor2,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           width: 150,
//                                                           height: 30,
//                                                           child: Center(
//                                                               child: Text(
//                                                             langKey == "ar"
//                                                                 ? "الدعم"
//                                                                 : "support agent",
//                                                             style: TextStyle(
//                                                                 color:
//                                                                     _textColor2),
//                                                           )),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ]),
//                                                 ),
//                                               ),
//                                             )
//                                           : index! <= 2
//                                               ? Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding: const EdgeInsets
//                                                               .symmetric(
//                                                           horizontal: 30),
//                                                       child: Container(
//                                                         decoration: BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                             border: Border.all(
//                                                                 color:
//                                                                     button1color)),
//                                                         child: Container(
//                                                           height: 130,
//                                                           width: MediaQuery.of(
//                                                                   context)
//                                                               .size
//                                                               .width,
//                                                           child: Column(
//                                                               children: [
//                                                                 Flexible(
//                                                                     child:
//                                                                         Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           8.0),
//                                                                   child: Text(
//                                                                     'مرحبًا عزيزي ${username} ! كيف يمكننا مساعدتك؟',
//                                                                     style: TextStyle(
//                                                                         color:
//                                                                             textColor,
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 )),
//                                                                 InkWell(
//                                                                   onTap: () {},
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                             .symmetric(
//                                                                         horizontal:
//                                                                             15,
//                                                                         vertical:
//                                                                             10),
//                                                                     child:
//                                                                         Container(
//                                                                       decoration: BoxDecoration(
//                                                                           color:
//                                                                               button1color,
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(5)),
//                                                                       width:
//                                                                           150,
//                                                                       height:
//                                                                           30,
//                                                                       child: Center(
//                                                                           child: Text(
//                                                                         langKey ==
//                                                                                 "ar"
//                                                                             ? "طلب سريع"
//                                                                             : "quick order",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.white),
//                                                                       )),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 InkWell(
//                                                                   onTap: () {
//                                                                     List<String>
//                                                                         data = [
//                                                                       "999999999",
//                                                                       "رسالة جديدة من الدعم",
//                                                                       ''
//                                                                     ];
//                                                                     Navigator.pushNamed(
//                                                                         context,
//                                                                         ChatCycle
//                                                                             .routeName,
//                                                                         arguments:
//                                                                             RouteArgument(param: data));
//                                                                   },
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                             .symmetric(
//                                                                         horizontal:
//                                                                             15,
//                                                                         vertical:
//                                                                             10),
//                                                                     child:
//                                                                         Container(
//                                                                       decoration: BoxDecoration(
//                                                                           color: buttonLightcolor.withOpacity(
//                                                                               0.5),
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(5)),
//                                                                       width:
//                                                                           150,
//                                                                       height:
//                                                                           30,
//                                                                       child: Center(
//                                                                           child: Text(
//                                                                         langKey ==
//                                                                                 "ar"
//                                                                             ? "الدعم"
//                                                                             : "support agent",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 button1color),
//                                                                       )),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ]),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10,
//                                                     ),
//                                                     Padding(
//                                                       padding: const EdgeInsets
//                                                               .symmetric(
//                                                           horizontal: 30),
//                                                       child: Container(
//                                                         decoration: BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10),
//                                                             border: Border.all(
//                                                                 color:
//                                                                     button1color)),
//                                                         child: Container(
//                                                           height: 130,
//                                                           width: MediaQuery.of(
//                                                                   context)
//                                                               .size
//                                                               .width,
//                                                           child: Column(
//                                                               children: [
//                                                                 const Flexible(
//                                                                     child:
//                                                                         Padding(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .all(
//                                                                               8.0),
//                                                                   child: Text(
//                                                                     'من فضلك ، اختر النموذج',
//                                                                     style: TextStyle(
//                                                                         color:
//                                                                             textColor,
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 )),
//                                                                 InkWell(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
//                                                                       // _containerHeight = 400;
//                                                                       _containerColor4 =
//                                                                           buttonLightcolor
//                                                                               .withOpacity(0.5);
//                                                                       _textColor4 =
//                                                                           button1color;
//                                                                       _containerColor3 =
//                                                                           button1color;
//                                                                       _textColor3 =
//                                                                           Colors
//                                                                               .white;
//                                                                       index = 2;
//                                                                     });
//                                                                     Navigator.push(
//                                                                         context,
//                                                                         MaterialPageRoute(
//                                                                             builder: (context) =>
//                                                                                 QuickScreen()));
//                                                                   },
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                             .symmetric(
//                                                                         horizontal:
//                                                                             15,
//                                                                         vertical:
//                                                                             10),
//                                                                     child:
//                                                                         Container(
//                                                                       decoration: BoxDecoration(
//                                                                           color:
//                                                                               _containerColor3,
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(5)),
//                                                                       width:
//                                                                           150,
//                                                                       height:
//                                                                           30,
//                                                                       child: Center(
//                                                                           child: Text(
//                                                                         langKey ==
//                                                                                 "ar"
//                                                                             ? "متاجر سريعة"
//                                                                             : "quick shops",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 _textColor3),
//                                                                       )),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 InkWell(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
//                                                                       // _containerHeight = 400;
//                                                                       _containerColor3 =
//                                                                           buttonLightcolor
//                                                                               .withOpacity(0.5);
//                                                                       _textColor3 =
//                                                                           button1color;
//                                                                       _containerColor4 =
//                                                                           button1color;
//                                                                       _textColor4 =
//                                                                           Colors
//                                                                               .white;
//                                                                     });
//                                                                     index = 3;
//                                                                   },
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                             .symmetric(
//                                                                         horizontal:
//                                                                             15,
//                                                                         vertical:
//                                                                             10),
//                                                                     child:
//                                                                         Container(
//                                                                       decoration: BoxDecoration(
//                                                                           color:
//                                                                               _containerColor4,
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(5)),
//                                                                       width:
//                                                                           150,
//                                                                       height:
//                                                                           30,
//                                                                       child: Center(
//                                                                           child: Text(
//                                                                         langKey ==
//                                                                                 "ar"
//                                                                             ? "منتجات سريعة"
//                                                                             : "quick products",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 _textColor4),
//                                                                       )),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ]),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                               : index! <= 3
//                                                   ? Column(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                                 border: Border.all(
//                                                                     color:
//                                                                         button1color)),
//                                                             child: Container(
//                                                               height: 130,
//                                                               width:
//                                                                   MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                               child: Column(
//                                                                   children: [
//                                                                     Flexible(
//                                                                         child:
//                                                                             Padding(
//                                                                       padding:
//                                                                           const EdgeInsets.all(
//                                                                               8.0),
//                                                                       child:
//                                                                           Text(
//                                                                         'مرحبًا عزيزي ${username} ! كيف يمكننا مساعدتك؟',
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 textColor,
//                                                                             fontWeight:
//                                                                                 FontWeight.bold),
//                                                                       ),
//                                                                     )),
//                                                                     InkWell(
//                                                                       onTap:
//                                                                           () {},
//                                                                       child:
//                                                                           Padding(
//                                                                         padding: const EdgeInsets.symmetric(
//                                                                             horizontal:
//                                                                                 15,
//                                                                             vertical:
//                                                                                 10),
//                                                                         child:
//                                                                             Container(
//                                                                           decoration: BoxDecoration(
//                                                                               color: button1color,
//                                                                               borderRadius: BorderRadius.circular(5)),
//                                                                           width:
//                                                                               150,
//                                                                           height:
//                                                                               30,
//                                                                           child: Center(
//                                                                               child: Text(
//                                                                             langKey == "ar"
//                                                                                 ? "طلب سريع"
//                                                                                 : "quick order",
//                                                                             style:
//                                                                                 TextStyle(color: Colors.white),
//                                                                           )),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     InkWell(
//                                                                       onTap:
//                                                                           () {
//                                                                         List<String>
//                                                                             data =
//                                                                             [
//                                                                           "999999999",
//                                                                           "رسالة جديدة من الدعم",
//                                                                           ''
//                                                                         ];
//                                                                         Navigator.pushNamed(
//                                                                             context,
//                                                                             ChatCycle
//                                                                                 .routeName,
//                                                                             arguments:
//                                                                                 RouteArgument(param: data));
//                                                                       },
//                                                                       child:
//                                                                           Padding(
//                                                                         padding: const EdgeInsets.symmetric(
//                                                                             horizontal:
//                                                                                 15,
//                                                                             vertical:
//                                                                                 10),
//                                                                         child:
//                                                                             Container(
//                                                                           decoration: BoxDecoration(
//                                                                               color: buttonLightcolor.withOpacity(0.5),
//                                                                               borderRadius: BorderRadius.circular(5)),
//                                                                           width:
//                                                                               150,
//                                                                           height:
//                                                                               30,
//                                                                           child: Center(
//                                                                               child: Text(
//                                                                             langKey == "ar"
//                                                                                 ? "الدعم"
//                                                                                 : "support agent",
//                                                                             style:
//                                                                                 TextStyle(color: button1color),
//                                                                           )),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ]),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                                 border: Border.all(
//                                                                     color:
//                                                                         button1color)),
//                                                             child: Container(
//                                                               height: 130,
//                                                               width:
//                                                                   MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                               child: Column(
//                                                                   children: [
//                                                                     Flexible(
//                                                                         child:
//                                                                             Padding(
//                                                                       padding:
//                                                                           const EdgeInsets.all(
//                                                                               8.0),
//                                                                       child:
//                                                                           Text(
//                                                                         'من فضلك ، اختر النموذج',
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 textColor,
//                                                                             fontWeight:
//                                                                                 FontWeight.bold),
//                                                                       ),
//                                                                     )),
//                                                                     InkWell(
//                                                                       onTap:
//                                                                           () {
//                                                                         setState(
//                                                                             () {});
//                                                                       },
//                                                                       child:
//                                                                           Padding(
//                                                                         padding: const EdgeInsets.symmetric(
//                                                                             horizontal:
//                                                                                 15,
//                                                                             vertical:
//                                                                                 10),
//                                                                         child:
//                                                                             Container(
//                                                                           decoration: BoxDecoration(
//                                                                               color: _containerColor3,
//                                                                               borderRadius: BorderRadius.circular(5)),
//                                                                           width:
//                                                                               150,
//                                                                           height:
//                                                                               30,
//                                                                           child: Center(
//                                                                               child: Text(
//                                                                             langKey == "ar"
//                                                                                 ? "متاجر سريعة"
//                                                                                 : "quick shops",
//                                                                             style:
//                                                                                 TextStyle(color: _textColor3),
//                                                                           )),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     InkWell(
//                                                                       onTap:
//                                                                           () {
//                                                                         setState(
//                                                                             () {
//                                                                           // _containerHeight = 400;
//                                                                           _containerColor3 =
//                                                                               buttonLightcolor.withOpacity(0.5);
//                                                                           _textColor3 =
//                                                                               button1color;
//                                                                           _containerColor4 =
//                                                                               button1color;
//                                                                           _textColor4 =
//                                                                               Colors.white;
//                                                                         });
//                                                                         index =
//                                                                             3;
//                                                                       },
//                                                                       child:
//                                                                           Padding(
//                                                                         padding: const EdgeInsets.symmetric(
//                                                                             horizontal:
//                                                                                 15,
//                                                                             vertical:
//                                                                                 10),
//                                                                         child:
//                                                                             Container(
//                                                                           decoration: BoxDecoration(
//                                                                               color: _containerColor4,
//                                                                               borderRadius: BorderRadius.circular(5)),
//                                                                           width:
//                                                                               150,
//                                                                           height:
//                                                                               30,
//                                                                           child: Center(
//                                                                               child: Text(
//                                                                             langKey == "ar"
//                                                                                 ? "منتجات سريعة"
//                                                                                 : "quick products",
//                                                                             style:
//                                                                                 TextStyle(color: _textColor4),
//                                                                           )),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ]),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                                 border: Border.all(
//                                                                     color:
//                                                                         button1color)),
//                                                             child: Container(
//                                                               height: 250,
//                                                               width:
//                                                                   MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                               child: Column(
//                                                                   children: [
//                                                                     Flexible(
//                                                                         child:
//                                                                             Padding(
//                                                                       padding:
//                                                                           const EdgeInsets.all(
//                                                                               8.0),
//                                                                       child:
//                                                                           Text(
//                                                                         'من فضلك ، اختر المناسبة',
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 textColor,
//                                                                             fontWeight:
//                                                                                 FontWeight.bold),
//                                                                       ),
//                                                                     )),
//                                                                     for (int i =
//                                                                             0;
//                                                                         i < HomeCubit.get(context).quickFilterModel!.data!.occasions!.length;
//                                                                         i++)
//                                                                       InkWell(
//                                                                         onTap:
//                                                                             () {
//                                                                           setState(
//                                                                               () {
//                                                                             select =
//                                                                                 i;
//                                                                             r1 =
//                                                                                 HomeCubit.get(context).quickFilterModel!.data!.occasions![i].id;
//                                                                             index =
//                                                                                 4;
//                                                                           });
//                                                                         },
//                                                                         child:
//                                                                             Padding(
//                                                                           padding: const EdgeInsets.symmetric(
//                                                                               horizontal: 15,
//                                                                               vertical: 10),
//                                                                           child:
//                                                                               Container(
//                                                                             decoration:
//                                                                                 BoxDecoration(color: select != i ? _containerColor5 : button1color, borderRadius: BorderRadius.circular(5)),
//                                                                             width:
//                                                                                 150,
//                                                                             height:
//                                                                                 30,
//                                                                             child: Center(
//                                                                                 child: Text(
//                                                                               langKey == "ar" ? "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.first.name}" : "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.last.name}",
//                                                                               style: TextStyle(color: select != i ? _textColor5 : Colors.white),
//                                                                             )),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                   ]),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     )
//                                                   : index! <= 4
//                                                       ? Column(
//                                                           children: [
//                                                             Padding(
//                                                               padding: const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                               child: Container(
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     border: Border.all(
//                                                                         color:
//                                                                             button1color)),
//                                                                 child:
//                                                                     Container(
//                                                                   height: 130,
//                                                                   width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                                   child: Column(
//                                                                       children: [
//                                                                         Flexible(
//                                                                             child:
//                                                                                 Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               Text(
//                                                                             'مرحبًا عزيزي ${username} ! كيف يمكننا مساعدتك؟',
//                                                                             style:
//                                                                                 TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                           ),
//                                                                         )),
//                                                                         InkWell(
//                                                                           onTap:
//                                                                               () {},
//                                                                           child:
//                                                                               Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(color: button1color, borderRadius: BorderRadius.circular(5)),
//                                                                               width: 150,
//                                                                               height: 30,
//                                                                               child: Center(
//                                                                                   child: Text(
//                                                                                 langKey == "ar" ? "طلب سريع" : "quick order",
//                                                                                 style: TextStyle(color: Colors.white),
//                                                                               )),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                         InkWell(
//                                                                           onTap:
//                                                                               () {
//                                                                             List<String>
//                                                                                 data =
//                                                                                 [
//                                                                               "999999999",
//                                                                               "رسالة جديدة من الدعم",
//                                                                               ''
//                                                                             ];
//                                                                             Navigator.pushNamed(context,
//                                                                                 ChatCycle.routeName,
//                                                                                 arguments: RouteArgument(param: data));
//                                                                           },
//                                                                           child:
//                                                                               Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(color: buttonLightcolor.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
//                                                                               width: 150,
//                                                                               height: 30,
//                                                                               child: Center(
//                                                                                   child: Text(
//                                                                                 langKey == "ar" ? "الدعم" : "support agent",
//                                                                                 style: TextStyle(color: button1color),
//                                                                               )),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ]),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                             Padding(
//                                                               padding: const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                               child: Container(
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     border: Border.all(
//                                                                         color:
//                                                                             button1color)),
//                                                                 child:
//                                                                     Container(
//                                                                   height: 130,
//                                                                   width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                                   child: Column(
//                                                                       children: [
//                                                                         Flexible(
//                                                                             child:
//                                                                                 Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               Text(
//                                                                             'من فضلك ، اختر النموذج',
//                                                                             style:
//                                                                                 TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                           ),
//                                                                         )),
//                                                                         InkWell(
//                                                                           onTap:
//                                                                               () {
//                                                                             setState(() {});
//                                                                           },
//                                                                           child:
//                                                                               Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(color: _containerColor3, borderRadius: BorderRadius.circular(5)),
//                                                                               width: 150,
//                                                                               height: 30,
//                                                                               child: Center(
//                                                                                   child: Text(
//                                                                                 langKey == "ar" ? "متاجر سريعة" : "quick shops",
//                                                                                 style: TextStyle(color: _textColor3),
//                                                                               )),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                         InkWell(
//                                                                           onTap:
//                                                                               () {
//                                                                             setState(() {
//                                                                               // _containerHeight = 400;
//                                                                               _containerColor3 = buttonLightcolor.withOpacity(0.5);
//                                                                               _textColor3 = button1color;
//                                                                               _containerColor4 = button1color;
//                                                                               _textColor4 = Colors.white;
//                                                                             });
//                                                                           },
//                                                                           child:
//                                                                               Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(color: _containerColor4, borderRadius: BorderRadius.circular(5)),
//                                                                               width: 150,
//                                                                               height: 30,
//                                                                               child: Center(
//                                                                                   child: Text(
//                                                                                 langKey == "ar" ? "منتجات سريعة" : "quick products",
//                                                                                 style: TextStyle(color: _textColor4),
//                                                                               )),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ]),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                             Padding(
//                                                               padding: const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                               child: Container(
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     border: Border.all(
//                                                                         color:
//                                                                             button1color)),
//                                                                 child:
//                                                                     Container(
//                                                                   height: 250,
//                                                                   width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                                   child: Column(
//                                                                       children: [
//                                                                         Flexible(
//                                                                             child:
//                                                                                 Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               Text(
//                                                                             'من فضلك ، اختر المناسبة',
//                                                                             style:
//                                                                                 TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                           ),
//                                                                         )),
//                                                                         for (int i =
//                                                                                 0;
//                                                                             i < HomeCubit.get(context).quickFilterModel!.data!.occasions!.length;
//                                                                             i++)
//                                                                           InkWell(
//                                                                             onTap:
//                                                                                 () {
//                                                                               setState(() {
//                                                                                 select = i;
//                                                                                 r1 = HomeCubit.get(context).quickFilterModel!.data!.occasions![i].id;
//                                                                                 index = 4;
//                                                                               });
//                                                                             },
//                                                                             child:
//                                                                                 Padding(
//                                                                               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: select != i ? _containerColor5 : button1color, borderRadius: BorderRadius.circular(5)),
//                                                                                 width: 150,
//                                                                                 height: 30,
//                                                                                 child: Center(
//                                                                                     child: Text(
//                                                                                   langKey == "ar" ? "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.first.name}" : "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.last.name}",
//                                                                                   style: TextStyle(color: select != i ? _textColor5 : Colors.white),
//                                                                                 )),
//                                                                               ),
//                                                                             ),
//                                                                           ),

//                                                                         // ),
//                                                                       ]),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                             Padding(
//                                                               padding: const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       30),
//                                                               child: Container(
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             10),
//                                                                     border: Border.all(
//                                                                         color:
//                                                                             button1color)),
//                                                                 child:
//                                                                     Container(
//                                                                   height: 200,
//                                                                   width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                                   child: Column(
//                                                                       children: [
//                                                                         Flexible(
//                                                                             child:
//                                                                                 Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               Text(
//                                                                             'من فضلك ، اختر النوع',
//                                                                             style:
//                                                                                 TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                           ),
//                                                                         )),
//                                                                         for (int i =
//                                                                                 0;
//                                                                             i < HomeCubit.get(context).quickFilterModel!.data!.typeSend!.length;
//                                                                             i++)
//                                                                           InkWell(
//                                                                             onTap:
//                                                                                 () {
//                                                                               setState(() {
//                                                                                 select2 = i;
//                                                                                 r2 = HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].id;
//                                                                                 index = 5;
//                                                                               });
//                                                                             },
//                                                                             child:
//                                                                                 Padding(
//                                                                               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: select2 != i ? _containerColor5 : button1color, borderRadius: BorderRadius.circular(5)),
//                                                                                 width: 150,
//                                                                                 height: 30,
//                                                                                 child: Center(
//                                                                                     child: Text(
//                                                                                   langKey == "ar" ? "${HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].translations?.first.name}" : "${HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].translations?.last.name}",
//                                                                                   style: TextStyle(color: select2 != i ? _textColor5 : Colors.white),
//                                                                                 )),
//                                                                               ),
//                                                                             ),
//                                                                           ),

//                                                                         // ),
//                                                                       ]),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         )
//                                                       : index! <= 5
//                                                           ? Column(
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .symmetric(
//                                                                       horizontal:
//                                                                           30),
//                                                                   child:
//                                                                       Container(
//                                                                     decoration: BoxDecoration(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                                 10),
//                                                                         border: Border.all(
//                                                                             color:
//                                                                                 button1color)),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           130,
//                                                                       width: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .width,
//                                                                       child: Column(
//                                                                           children: [
//                                                                             Flexible(
//                                                                                 child: Padding(
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Text(
//                                                                                 'مرحبًا عزيزي ${username} ! كيف يمكننا مساعدتك؟',
//                                                                                 style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                               ),
//                                                                             )),
//                                                                             InkWell(
//                                                                               onTap: () {},
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: button1color, borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "طلب سريع" : "quick order",
//                                                                                     style: TextStyle(color: Colors.white),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 List<String> data = [
//                                                                                   "999999999",
//                                                                                   "رسالة جديدة من الدعم",
//                                                                                   ''
//                                                                                 ];
//                                                                                 Navigator.pushNamed(context, ChatCycle.routeName, arguments: RouteArgument(param: data));
//                                                                               },
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: buttonLightcolor.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "الدعم" : "support agent",
//                                                                                     style: TextStyle(color: button1color),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           ]),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .symmetric(
//                                                                       horizontal:
//                                                                           30),
//                                                                   child:
//                                                                       Container(
//                                                                     decoration: BoxDecoration(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                                 10),
//                                                                         border: Border.all(
//                                                                             color:
//                                                                                 button1color)),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           130,
//                                                                       width: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .width,
//                                                                       child: Column(
//                                                                           children: [
//                                                                             Flexible(
//                                                                                 child: Padding(
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Text(
//                                                                                 'من فضلك ، اختر النموذج',
//                                                                                 style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                               ),
//                                                                             )),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 setState(() {});
//                                                                               },
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: _containerColor3, borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "متاجر سريعة" : "quick shops",
//                                                                                     style: TextStyle(color: _textColor3),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 setState(() {
//                                                                                   // _containerHeight = 400;
//                                                                                   _containerColor3 = buttonLightcolor.withOpacity(0.5);
//                                                                                   _textColor3 = button1color;
//                                                                                   _containerColor4 = button1color;
//                                                                                   _textColor4 = Colors.white;
//                                                                                 });
//                                                                                 // index =
//                                                                                 //     3;
//                                                                               },
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: _containerColor4, borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "منتجات سريعة" : "quick products",
//                                                                                     style: TextStyle(color: _textColor4),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           ]),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .symmetric(
//                                                                       horizontal:
//                                                                           30),
//                                                                   child:
//                                                                       Container(
//                                                                     decoration: BoxDecoration(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                                 10),
//                                                                         border: Border.all(
//                                                                             color:
//                                                                                 button1color)),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           250,
//                                                                       width: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .width,
//                                                                       child: Column(
//                                                                           children: [
//                                                                             Flexible(
//                                                                                 child: Padding(
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Text(
//                                                                                 'من فضلك ، اختر المناسبة',
//                                                                                 style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                               ),
//                                                                             )),
//                                                                             for (int i = 0;
//                                                                                 i < HomeCubit.get(context).quickFilterModel!.data!.occasions!.length;
//                                                                                 i++)
//                                                                               InkWell(
//                                                                                 onTap: () {
//                                                                                   setState(() {
//                                                                                     select = i;
//                                                                                     r1 = HomeCubit.get(context).quickFilterModel!.data!.occasions![i].id;
//                                                                                     index = 4;
//                                                                                   });
//                                                                                 },
//                                                                                 child: Padding(
//                                                                                   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                   child: Container(
//                                                                                     decoration: BoxDecoration(color: select != i ? _containerColor5 : button1color, borderRadius: BorderRadius.circular(5)),
//                                                                                     width: 150,
//                                                                                     height: 30,
//                                                                                     child: Center(
//                                                                                         child: Text(
//                                                                                       langKey == "ar" ? "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.first.name}" : "${HomeCubit.get(context).quickFilterModel!.data!.occasions![i].translations?.last.name}",
//                                                                                       style: TextStyle(color: select != i ? _textColor5 : Colors.white),
//                                                                                     )),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                           ]),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .symmetric(
//                                                                       horizontal:
//                                                                           30),
//                                                                   child:
//                                                                       Container(
//                                                                     decoration: BoxDecoration(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                                 10),
//                                                                         border: Border.all(
//                                                                             color:
//                                                                                 button1color)),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           200,
//                                                                       width: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .width,
//                                                                       child: Column(
//                                                                           children: [
//                                                                             Flexible(
//                                                                                 child: Padding(
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Text(
//                                                                                 'من فضلك ، اختر النوع',
//                                                                                 style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                               ),
//                                                                             )),
//                                                                             for (int i = 0;
//                                                                                 i < HomeCubit.get(context).quickFilterModel!.data!.typeSend!.length;
//                                                                                 i++)
//                                                                               InkWell(
//                                                                                 onTap: () {
//                                                                                   setState(() {
//                                                                                     select2 = i;
//                                                                                     r2 = HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].id;
//                                                                                     index = 5;
//                                                                                   });
//                                                                                 },
//                                                                                 child: Padding(
//                                                                                   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                   child: Container(
//                                                                                     decoration: BoxDecoration(color: select2 != i ? _containerColor5 : button1color, borderRadius: BorderRadius.circular(5)),
//                                                                                     width: 150,
//                                                                                     height: 30,
//                                                                                     child: Center(
//                                                                                         child: Text(
//                                                                                       langKey == "ar" ? "${HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].translations?.first.name}" : "${HomeCubit.get(context).quickFilterModel!.data!.typeSend![i].translations?.last.name}",
//                                                                                       style: TextStyle(color: select2 != i ? _textColor5 : Colors.white),
//                                                                                     )),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                           ]),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .symmetric(
//                                                                       horizontal:
//                                                                           30),
//                                                                   child:
//                                                                       Container(
//                                                                     decoration: BoxDecoration(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                                 10),
//                                                                         border: Border.all(
//                                                                             color:
//                                                                                 button1color)),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           130,
//                                                                       width: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .width,
//                                                                       child: Column(
//                                                                           children: [
//                                                                             Flexible(
//                                                                                 child: Padding(
//                                                                               padding: const EdgeInsets.all(8.0),
//                                                                               child: Text(
//                                                                                 'من فضلك ، اختر التصنيف',
//                                                                                 style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//                                                                               ),
//                                                                             )),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 setState(() {
//                                                                                   _containerColor6 = button1color;
//                                                                                   _textColor6 = Colors.white;
//                                                                                   r3 = 1;
//                                                                                 });

//                                                                                 Navigator.push(
//                                                                                     context,
//                                                                                     MaterialPageRoute(
//                                                                                         builder: (context) => QuickFilter(
//                                                                                               chatbot: true,
//                                                                                               consigneeid: r2,
//                                                                                               occasionid: r1,
//                                                                                               isavailable: r3,
//                                                                                             )));
//                                                                               },
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: _containerColor6, borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "طلب جاهز" : "ready order",
//                                                                                     style: TextStyle(color: _textColor6),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 setState(() {
//                                                                                   _containerColor7 = button1color;
//                                                                                   _textColor7 = Colors.white;
//                                                                                   r3 = 0;
//                                                                                 });
//                                                                                 Navigator.push(
//                                                                                     context,
//                                                                                     MaterialPageRoute(
//                                                                                         builder: (context) => QuickFilter(
//                                                                                               chatbot: true,
//                                                                                               consigneeid: r2,
//                                                                                               occasionid: r1,
//                                                                                               isavailable: r3,
//                                                                                             )));
//                                                                               },
//                                                                               child: Padding(
//                                                                                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                                                                                 child: Container(
//                                                                                   decoration: BoxDecoration(color: _containerColor7, borderRadius: BorderRadius.circular(5)),
//                                                                                   width: 150,
//                                                                                   height: 30,
//                                                                                   child: Center(
//                                                                                       child: Text(
//                                                                                     langKey == "ar" ? "طلب غير جاهز" : "nonready order",
//                                                                                     style: TextStyle(color: _textColor7),
//                                                                                   )),
//                                                                                 ),
//                                                                               ),
//                                                                             ),

//                                                                             // ),
//                                                                           ]),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             )
//                                                           : null)
//                                   : Container(),
//                             ],
//                           ),
//                         ]))),
//               ));
//         },
//       ),
//     );
//   }
// }
