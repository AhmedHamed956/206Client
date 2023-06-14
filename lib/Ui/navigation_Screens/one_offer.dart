import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/Ui/home/home_screen.dart';
import 'package:project/Ui/navigation_Screens/shopDetails.dart';

import '../../Shared/constant.dart';
import '2.dart';
import 'myOrderScreen.dart';
import 'Notification_Screen.dart';
import 'main_screen.dart';

class OneOffer extends StatefulWidget {
  const OneOffer({super.key});

  @override
  State<OneOffer> createState() => _OneOfferState();
}

class _OneOfferState extends State<OneOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "206 تصفح عروض",
          style: TextStyle(color: appbarTextcolor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView.separated(
            // physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  height: 210,
                  width: 405,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //     // color: buttonLightcolor,
                    //     ),
                  ),
                  child: Column(children: [
                    // isLoading == false
                    // ?
                    //  Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: 133,
                    //     child: Center(
                    //       child: CircularProgressIndicator(
                    //           color: button1color),
                    //     ),
                    //   )
                    // :
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuboneOffer()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 133,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                10,
                              ),
                              topLeft: Radius.circular(10)),
                          // image: DecorationImage(
                          //     image: NetworkImage(
                          //         '${domainlink}${model.image}'),
                          //     fit: BoxFit.fill)
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         '${domainlink}${model.image}'),
                            //     fit: BoxFit.fill)

                            child: Image.asset('assets/images/206_Logo.png')),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'name',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          // Container(
                          //   decoration: const BoxDecoration(
                          //       shape: BoxShape.circle),
                          //   child: GradientIcon(
                          //     Icons.info,
                          //     20.0,
                          //     const LinearGradient(
                          //       colors: <Color>[
                          //         button1color,
                          //         button2color,
                          //       ],
                          //       begin: Alignment.topLeft,
                          //       end: Alignment.bottomRight,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Text(
                            'dis',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 21,
                ),
            itemCount: 10),
      ),
    );
  }
}

class SuboneOffer extends StatefulWidget {
  const SuboneOffer({super.key});

  @override
  State<SuboneOffer> createState() => _SuboneOfferState();
}

class _SuboneOfferState extends State<SuboneOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "206 عروض",
          style: TextStyle(color: appbarTextcolor),
        ),
      ),
      body: Container(
        // height: 210,
        // width: 405,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //     // color: buttonLightcolor,
          //     ),
        ),
        child: Column(children: [
          // isLoading == false
          // ?
          //  Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 133,
          //     child: Center(
          //       child: CircularProgressIndicator(
          //           color: button1color),
          //     ),
          //   )
          // :
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SubSubOneOffer()));
            },
            child: Container(
              height: 262,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      10,
                    ),
                    topLeft: Radius.circular(10)),
                // image: DecorationImage(
                //     image: NetworkImage(
                //         '${domainlink}${model.image}'),
                //     fit: BoxFit.fill)
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         '${domainlink}${model.image}'),
                  //     fit: BoxFit.fill)

                  child: Image.asset('assets/images/206_Logo.png')),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'name',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                // Container(
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle),
                //   child: GradientIcon(
                //     Icons.info,
                //     20.0,
                //     const LinearGradient(
                //       colors: <Color>[
                //         button1color,
                //         button2color,
                //       ],
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  'dis',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SubSubOneOffer extends StatefulWidget {
  final bool? isOffer;
  const SubSubOneOffer({
    this.isOffer,
    this.title,
  });
  final String? title;

  @override
  _SubSubOneOfferState createState() => _SubSubOneOfferState();
}

class _SubSubOneOfferState extends State<SubSubOneOffer> {
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
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  final List<Widget> _pages = [
    MainScreen(),
    const OfferScreen(),
    const MyOrderScreen(),
    const NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _pageController == 0
          ? PreferredSize(
              preferredSize: AppBar().preferredSize,
              child: SafeArea(
                child: Container(
                  child: AppBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0))),
                    elevation: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            )
          : null,
      body: Stack(
        children: <Widget>[
          Padding(
            // ignore: sort_child_properties_last
            child: const ShopDetails(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

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
