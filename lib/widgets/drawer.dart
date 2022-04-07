import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilled_tasker/pages/about_page.dart';
import 'package:skilled_tasker/pages/affilate_page.dart';
import 'package:skilled_tasker/pages/home_page.dart';
import 'package:skilled_tasker/pages/login_page.dart';
import 'package:skilled_tasker/pages/myprofile_page.dart';
import 'package:skilled_tasker/pages/mytask_page.dart';
import 'package:skilled_tasker/pages/notification_page.dart';
import 'package:skilled_tasker/pages/reward_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Align(
            alignment: Alignment.center,
            child: const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.green),
                  accountEmail: Text(
                    "Sachinladwa1995@gmail.com",
                    style: TextStyle(),
                  ),
                  accountName: Text("Sachin kumar"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Afflilate"),
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              //Get.off(HomaPage());
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomaPage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "TaskPro",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text(
                "MyProfile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyTaskPage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.command,
                color: Colors.black,
              ),
              title: Text(
                "MyTask",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RewardPage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.gift,
                color: Colors.black,
              ),
              title: Text(
                "Reward",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AffilatePage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.share,
                color: Colors.black,
              ),
              title: Text(
                "Affiliate",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.slider_horizontal_below_rectangle,
                color: Colors.black,
              ),
              title: Text(
                "Notification",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.info,
                color: Colors.black,
              ),
              title: Text(
                "About",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Skilled Tasker"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Yes"))
                      ],
                    );
                  });
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
