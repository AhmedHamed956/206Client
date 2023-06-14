import 'package:flutter/material.dart';

const Color mainBackgourndColor = Color(0xffF5F5F5);
const Color textFieldColor = Color(0xffE6E8EE);
const Color textColor = Color(0xff5B5B5B);

const Color dotColor = Color(0xffD8D8D8);

const Color boardingText = Color(0xff2A2A2A);
const Color skipColor = Color(0xff5D5D5D);
const Color hinitTextColor = Color(0xffA2A2A2);
const Color appbarTitleColor = Color(0xff202A2A);
const Color favouteIconColor = Color(0xffFAFAFA);
const Color openingNowColor = Color(0xff0AB973);
const Color unSelectedIndcatorColor = Color(0xff747373);
const Color accountTextColor = Color(0xff172239);
const Color containerborderColor = Color(0xffEEEEEE);
const Color shopDetailnameColor = Color(0xff131212);
const Color shopDetaillocationColor = Color(0xff00D153);
const Color shopDetailKmColor = Color(0xff565656);

const Color otpTexecolor = Color(0xff2D2D31);
const Color performaceCardcolor = Color(0xffD2D2D2);
const Color button1color = Color(0xff390099);
const Color button2color = Color(0xffA10CA4);
const Color boldTextcolor = Color(0xff222222);
const Color resendTextcolor = Color(0xffFF0054);
const Color circleColor = Color(0xffEEEDF2);
const Color greencolor = Color(0xff0EAE69);
const Color greenAcceptcolor = Color(0xff24B769);
const Color redRefusedcolor = Color(0xffE50E0E);
const Color searchCirclecolor = Color(0xffFAFBF8);
const Color orderContainerColor = Color(0xffF4F4F4);
const Color orderNumberColor = Color(0xffFECE2F);
const Color purpleColor = Color(0xffE5D7FD);
const Color blueLightColor = Color(0xff009EE117);
const Color priceColor = Color(0xff49512A);
const Color notificaton1 = Color(0xff49512A);
const Color notificaton3 = Color(0xffcfbe27);
const Color notificaton4 = Color(0xffC70A0A);

const Color arrowbackcolor = Color(0xff333333);

const Color quickcolor = Color(0xff00b14c);
const Color completeTextcolor = Color(0xff0DB43F);
const Color cancelTextcolor = Color(0xffe60d24);
const Color cancelTTextcolor = Color(0xffE60D0D);

const Color appbarTextcolor = Color(0xff191A1A);
const Color mainColorLite = Color(0xff2f84ed);
const Color shopCloseColorLite = Color(0xffA8A8A8);
// const Color purpleColor = Color(0xff980FA7);
const Color indicatorColor = Color(0xff9C0DA5);
const Color borderColor = Color(0xff8516AF);
const Color border2Color = Color(0xffDFDFDF);
const Color accountItemsColors = Color(0xff8b48fc);
const Color accountItemsListColors = Color(0xff262729);
const Color settingtemsListColors = Color(0xff191616);
const Color settingArrow = Color(0xff444344);

const Color shadowColor = Color(0xff000000);
const Color orderCardColor = Color(0xffF6EDFF);
const Color cancelButtonColor = Color(0xffFF4747);
const Color trackpointColor = Color(0xffCECECE);
const Color rateColor = Color(0xffFFA41B);
const Color orderNumColor = Color(0xffffdba1f);
const Color deliveryappBar1Color = Color(0xff8217B0);
const Color deliveryappBar2Color = Color(0xff970FA7);
const Color deliverytrackOrderisColor = Color(0xffD6BDDC);
const Color deliverytrackOrdernoColor = Color(0xffFAF7FE);
const Color trackOrderoffColor = Color(0xff282829);

const Color smalltextColor = Color(0xff111212);
const Color dividerColor = Color(0xffE8E8E8);
const Color cardcolor = Color(0xffEFEFEF);
const Color textfieldLabelcolor = Color(0xff49454F);
const Color profilebordercolor = Color(0xff464646);
const Color clienderbordercolor = Color(0xff0A7AFF);
const Color deliverWalletCardcolor = Color(0xffF9F9F9);

late String? counrty = '';
late String? city = '';
late String? street = '';
String clientAdress = "";
bool? cartIseEmpty;
String scheduled = '';
String time = '';
String am_pm = '';
int? stepp;

const int currentindex = 0;
bool ischat = false;
String? token;
String? agoratoken;
String? channelname;

String? fcmToken;
int? userId;
String? username;
String? userphone;
String? userEmail;
String? mylocation;
String? mycity;
String? avatar;

var myLat;
var myLong;

bool dayy = false;

String? mystreet;

bool showcart = false;
// const String domainlink = 'https://biflora.bluecode.sa/';
int total = 0;

// const Container ingr edient = const Container(decoration: BoxDecoration(
//   gradient:
// ),)
LinearGradient kAmberGradientColor = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xAFF890098),
      Color(0xAFF7125F2),
    ]);
LinearGradient quickButton = const LinearGradient(colors: [
  Color(0xff59b81e),
  Color(0xffb0c81f),
]);
LinearGradient trackPointButton = const LinearGradient(colors: [
  Color(0xffCECECE),
  Color(0xffCECECE),
]);
LinearGradient maingradientColor =
    const LinearGradient(colors: [button1color, button2color]);

// void sginOut(context) async {
//   await storage.delete(key: "myLocation");
//   await storage.delete(key: "myAddress");

//   CacheHelper.removeData(key: 'token').then((value) {
//     CacheHelper.removeData(key: 'mylocation').then((value) {}).then((value) {
//       CacheHelper.removeData(key: 'mycity').then((value) {}).then((value) {
//         CacheHelper.removeData(key: 'mycity').then((value) {}).then((value) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const LoginScreen()));
//         });
//       });
//     });
//   });
// }
