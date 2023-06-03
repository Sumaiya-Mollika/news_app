import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        decoration: BoxDecoration(
            color: Colors.white, image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 30,
              width: 80,
              height: 200,
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
              ),
            ),
            Positioned(
              left: 140,
              width: 80,
              height: 150,
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
              ),
            ),
            Positioned(
              right: 40,
              top: 40,
              width: 80,
              height: 150,
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
              ),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "News",
                    style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
