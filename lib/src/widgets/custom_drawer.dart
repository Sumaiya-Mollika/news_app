import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/config/base.dart';
import 'package:news_app/src/views/bookmarks_screen.dart';

class CustomDrawer extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: Get.width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 25),
            height: 350,
            width: Get.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/user.png',
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    authC.auth.currentUser!.email!,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: GestureDetector(
              onTap: () {
                newsC.getBookMarks(uid: authC.auth.currentUser!.uid);
                Get.to(BookMarksScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.bookmark_outlined,
                    color: Color.fromRGBO(50, 59, 226, 0.6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'BookMarks',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                      color: Color.fromRGBO(50, 59, 226, 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Color.fromRGBO(50, 59, 226, 0.6),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: GestureDetector(
              onTap: () {
                authC.logOut();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Color.fromRGBO(50, 59, 226, 0.6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                      color: Color.fromRGBO(50, 59, 226, 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
