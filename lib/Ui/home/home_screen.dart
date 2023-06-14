import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:project/Shared/constant.dart';
import 'package:project/Ui/navigation_Screens/2.dart';
import 'package:project/Ui/navigation_Screens/myOrderScreen.dart';
import 'package:project/Ui/navigation_Screens/Notification_Screen.dart';
import 'package:project/Ui/navigation_Screens/main_screen.dart';
import 'package:project/widgets/keep_alive.dart' as keep;

import '../../network/local/cache-helper.dart';
import '../navigation_Screens/Account_Screen.dart';

class HomeScreen extends StatefulWidget {
  final bool? isOffer;
  const HomeScreen({
    this.isOffer,
    this.title,
  });
  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int selectedPos = 0;
  bool? isOffer;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      // Image.asset(
      'assets/images/main.png',
      // ),
      "Home",
      button1color,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      // Image.asset(
      'assets/images/offers.png',
      // ),
      "Offers",
      button1color,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      // Image.asset(
      'assets/images/myOrder.png',
      // ),
      "Orders",
      button1color,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      // Image.asset(
      'assets/images/Notification.png',
      // ),
      "Notifications",
      button1color,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      // Image.asset(
      'assets/images/account.png',
      // ),
      "Account",
      button1color,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    // token = CacheHelper.getData(key: 'token');

    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  final List<Widget> _pages = [
    MainScreen(),
    const OfferScreen(),
    const MyOrderScreen(),
    const NotificationScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          Padding(
            // ignore: sort_child_properties_last
            child: PageView.custom(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {},
                childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return keep.KeepAlive(
                      widget: _pages[index], key: const ValueKey<String>(""));
                }, childCount: _pages.length)),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  // Widget bodyContainer() {
  //   Color? selectedColor = tabItems[selectedPos].circleColor;
  //   String slogan;
  //   switch (selectedPos) {
  //     case 0:
  //       slogan = "Family, Happiness, Food";
  //       break;
  //     case 1:
  //       slogan = "Find, Check, Use";
  //       break;
  //     case 2:
  //       slogan = "Receive, Review, Rip";
  //       break;
  //     case 3:
  //       slogan = "Noise, Panic, Ignore";
  //       break;
  //     case 4:
  //       slogan = "Noise, Panic,";
  //       break;
  //     default:
  //       slogan = "";
  //       break;
  //   }

  //   return GestureDetector(
  //     child: Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       color: Colors.white,
  //       child: Center(
  //         child: Text(
  //           slogan,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 20,
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       if (_navigationController.value == tabItems.length - 1) {
  //         _navigationController.value = 0;
  //       } else {
  //         _navigationController.value = _navigationController.value! + 1;
  //       }
  //     },
  //   );
  // }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() => _selectedPageIndex = selectedPos!.toInt());
        print(_selectedPageIndex);
        _pageController.jumpToPage(selectedPos!.toInt());
        // setState(() {

        //   this.selectedPos = selectedPos ?? 0;
        //   print(_navigationController.value);
        // });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
