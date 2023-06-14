import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Shared/constant.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          "الاعدادات",
          style: TextStyle(color: appbarTextcolor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              color: Colors.white,
              // elevation: 6.0,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                              color: accountItemsColors.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'اللغة',
                          style: TextStyle(
                              color: settingtemsListColors, fontSize: 14),
                        ),
                        Spacer(),
                        Text(
                          'Arabic',
                          style: TextStyle(color: button1color, fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: settingArrow,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                              color: accountItemsColors.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'شروط الاستخدام',
                          style: TextStyle(
                              color: settingtemsListColors, fontSize: 14),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: settingArrow,
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                                color: accountItemsColors.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'مساعدة',
                            style: TextStyle(
                                color: settingtemsListColors, fontSize: 14),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: settingArrow,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                              color: accountItemsColors.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'عن التطبيق',
                          style: TextStyle(
                              color: settingtemsListColors, fontSize: 14),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: settingArrow,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                              color: accountItemsColors.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'قيم التطبيق',
                          style: TextStyle(
                              color: settingtemsListColors, fontSize: 14),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: settingArrow,
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
