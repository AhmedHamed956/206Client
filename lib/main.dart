import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/common/route_argument.dart';
import 'package:project/common/routes.dart';

import 'Ui/Login/Cubit/cubit.dart';
import 'Ui/Login/login_Screen.dart';
import 'Ui/home/Cubit.dart';
import 'Ui/home/home_screen.dart';
import 'Ui/splash_Screen.dart';
import 'chat/helper/firebase_options.dart';
import 'chat/helper/local_notification_service.dart';
import 'chat/helper/navigation_service.dart';
import 'chat/ui/screens/chat_cycle.dart';
import 'network/local/cache-helper.dart';
import 'network/remote/Dio_helper.dart';

final gloScaffMessKey = GlobalKey<ScaffoldMessengerState>();
FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.requestPermission();

  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  LocalNotificationService.initialize(flnp).then((_) {
    debugPrint('setupPlugin: setup success');
  }).catchError((Object error) {
    debugPrint('Error: $error');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    if (message.notification != null) {
      log("Message data payload: ${message.data}");

      flnp.show(
          message.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
              android:
                  LocalNotificationService.androidPlatformChannelSpecifics),
          payload: message.data.toString());
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

  // CacheHelper.getData(key: 'deliveryApp') == true
  //     ? deliveryApp = true
  //     : deliveryApp = false;
  // print('DeliveryApp $deliveryApp');
  // token = '9|HBj6WP4WVflVkoK7Wf7CJjvRkR7pS9Fca5uWVqda';
  // token = '162|cMjqznTWBhX4PH1LiyUiexjvI2hu3Sx9aoMPHnY4';
  // token = '250|peTLz93OmQkqlYIrbaUt4D1HeLXUpnq3XdBQ9p4Y';

  token = CacheHelper.getData(key: 'token');

  // CacheHelper.getData(key: 'token');
  // token =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjUzZTg3ZmFlNTI4M2E5ZjhiYWYxMDQ4M2YzYTNkNjFmMTE2MDJjMDQwY2QyY2ZmMjljOWU5OWVmMWE1MGUyNDYxZThiM2RjNmU3YWU3YzQiLCJpYXQiOjE2ODYwODc3MDUuNDQ2MzI2LCJuYmYiOjE2ODYwODc3MDUuNDQ2MzI4LCJleHAiOjE3MTc3MTAxMDUuNDQ0Mzg1LCJzdWIiOiI1MiIsInNjb3BlcyI6W119.a3CDsUqr_Za_Uqzh_dYljkMqxYPZpEqLksVLO_Z28t7br0i-n4N9xTirfw2Zuxb2g7hHX6HZXzYAQzLlAhhNfejk7xpMgD7LI-wEFOiZMqpKA-gq8_EnzYo40NjhM6FExY3lQzix87qNeS4pnN9aiPXnHbh02oKbIkpNlYZV4-1Qo-B4O1bLYKsz0mPOU-Z0N1WTyL7EdF2q0vUaYukVg-JMyS1AHvpZjh1aIfw0xsFPyQ-67BvhegDdRtcQAtwrwAkF9yiGiGz2OTWStHx3EfrFsmEIGOXJMgTO1YTBouuYGNwPiEAn3rFczCSKiMDwmNZRRSQFs52Lo2pAgxg98lKi2Mg3ylaa4GrnU2yLRHmzNA5-G4IaEg0aZreOEFxIBBpSoEGpH4b9egHFgVOnNmjlUiC0LYp8oazNMXPVrVjp7bBdxsVrN9t7zjtb0DMvEDOti7uotgqsi7Qkn0xOcQDvLDYGA4IWSbrDI-vaVCehwWsS5pLGkp85eYSr7livNSLFhaqMNmHWEz21_EGShNKyXmbzXVfUys9IJPG0NmBRQYVCcO0qHzpWxLzKYxboqrmXymeA5uhT4JUvZShANz1ZTpaIhIrZG2NnewT72f1tn-DAvZ_CmlEfa7YaZBCpSfgxl8G5O4Pu5o3BukQRE2Q2Tm4DUlyEWZjWj6Lif8g';
  // CacheHelper.getData(key: 'token');
  // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNWIxNjg2YTM0OTY0MjcxOGI4YWVlMjJjMTI0NzEwMjk0ZjU1ZTk0OWRjZTc3YjdlZDRlZGQ4NTc3MGMwN2ExZGQ4NmM2OTJhYzhmOWI5MmUiLCJpYXQiOjE2ODU0MzMyNjYuNTY2MjI1LCJuYmYiOjE2ODU0MzMyNjYuNTY2MjI3LCJleHAiOjE3MTcwNTU2NjYuNTU5NDg4LCJzdWIiOiI0MCIsInNjb3BlcyI6W119.ASWS5TY-DN29YwBFUDyVYk3rkwIaR2RGg3MDAKyRsW04khA8NzlY9WedIhwGY2CHzun0H4jrNuIbHJ-qyNqle7GtqI8Frdv57tF96QX-KFS458zrlTif7DFB-J0EVVdDct5llGTWWgR0LVSZG9nVd_VJLF_pSoKwF6UReKwe6KPTqsQCwreFU2C2oo3Wbm5L8fcw4I4EGenZIiIF4aR1Xt0FtsiX_qXeRB7wpjyZmIZXt3OTMmxDrdSP8LRPon1V4mhGJwsZem05UdxqKyhPUKCAhJhjJy3npJrONZl8zObd3UUTvItPJGndB2vz-9s0Zz6eYDKOd-VKau81X4A9CZrxkIMs4IEfNEl7u2zmixmtobpT6tDMfUsaeH5ddSUuzUCRs_2ZSeK37Ey64nGYf-iDbJVNgTdFmfdO4RXAw0UexHHMIX_BdDVWCmA8Y8L8_GZhAA-EjC8XtcWmGrLVeFsHc9ftUldEDU1nUymNzQ2DvY26Othz6KVm4BHWggLH9XhovIRVK2NCBd_hkVue44vdQxPS_Hv-GE_7X-4tH_rdGU3-4ELhQk_yAkE1Y5yylke295hSJrBz0bbkKw0H5xEFJcnbr9UtFOLb_bHKWdoL7w87EhFU9HqVw6Hr7eaSw-T5_SG90GQzarsGxqpWZefcWTYNo3EuJ80USVhQgdU';
  // CacheHelper.getData(key: 'token');
  // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMjI1NTk1NmMwNjQ3ZjFhOGQzYzViMGE1OTM0ZjdjYTc2ODIyZDY5MWVlMzBhOWNlMWE5ZWI0MjZkMjcxYmIxMGJkZGUyM2YyMjQ2MWYyZWQiLCJpYXQiOjE2ODQ3NDc2NDkuNzEwODEzLCJuYmYiOjE2ODQ3NDc2NDkuNzEwODE2LCJleHAiOjE3MTYzNzAwNDkuNzA0ODI5LCJzdWIiOiI0MCIsInNjb3BlcyI6W119.uqhEljFGlcMplK-M6QqImKnCaTpNFnxt9ZDu6qbEtilWhEEccZjGi2NEpmCG2AtTzACdD3rOS7yA-voJHIvtU_WCKkoto635M9hXKaMqaWGHDobcsiZ-S0AAtxEj_qjzuc0F2DSMmdKukdEBQSA2LKIv8NDJNgS1sZUXNTYevPfP36qMo7dEwJToKtKzw1a1fWU3xd70uH2anK2s09o6gBM0QVkLWJRL7_-IK_tXL7iocWk6Dxs13MIMbofmkHTjSQqjzln3Kys1qMWFrGar7xpQRXRa3dWr7yNO8Fh4y11cnQhoyXhB825Qd3wohq2QfIF0vHk_uFSYWIFML5Rq3NjstrGAPE__cXIFOy9ShfKMgN4brry9Jiu_UOdj1lumChy3gV1qvd98JyoQhPrO9KUFHxcszqZUB6zHn03gjPIFiMt769KiCU2TKN3OkN-p7DZYGTb3REb1fgJb2YlmwysW8crBN8Ka3Stnrc5QnQCQJe0S2g3HVDmu1kFZu6QTeA9GXVs6BC5k6PB-r2RVQvcw-nAfIwRl4Ly1JAEMFTKbI0-yJhIIXxgTkroOnqr5ZQqZ9Rubhexzoj8OVaS-pL-8qL-6LzAdgEuoBg0JaSRjwcu5B99-iNy15qljZzQAV3FqwJlPr0xpBN7sf7Y_PopISKGIdTeOOkUABbr2Gr4';
  // fcmToken = CacheHelper.getData(key: 'fcm_token');
  userId = CacheHelper.getData(key: 'userId');

  username = CacheHelper.getData(key: 'username');
  userphone = CacheHelper.getData(key: 'userphone');
  userEmail = CacheHelper.getData(key: 'userEmail');
  avatar = CacheHelper.getData(key: 'avatar');
  myLat = CacheHelper.getData(key: 'myLat');
  myLong = CacheHelper.getData(key: 'myLong');
  print("fcmToken $fcmToken");
  print("userId $userId");

  print(token);
  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = const SplashPage();
  }

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => LoginScreenCubit()),
    // BlocProvider(create: (context) => HomeCubit()..ordersScreen()),
    BlocProvider(create: (context) => HomeCubit()),
    // BlocProvider(
    //     create: (context) => GlobalBloc()
    //       ..add(StartAppEvent())
    //       ..add(DeliveryAppEvent()))
  ], child: MyApp(startwidget: widget)));
}

class MyApp extends StatefulWidget {
  late Widget startwidget;

  MyApp({super.key, required this.startwidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '206',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            checkboxTheme: CheckboxThemeData(
                fillColor:
                    MaterialStateColor.resolveWith((states) => button1color)),
            fontFamily: 'Tajawal'),
        scaffoldMessengerKey: gloScaffMessKey,
        home: const SplashPage(),
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // flnp.show(
  //     message.hashCode,
  //     message.notification!.title,
  //     message.notification!.body,
  //     NotificationDetails(
  //         android:
  //         LocalNotificationService.androidPlatformChannelSpecifics),
  //     payload: message.data.toString());
  print("Handling a background message: ${message.messageId}");
}

void _handleMessage(RemoteMessage message) {
  List<String> data0 = [message.data['id'], "Support", ''];
  NavigationService.navigationKey.currentState!
      .pushNamed(ChatCycle.routeName, arguments: RouteArgument(param: data0));
}
