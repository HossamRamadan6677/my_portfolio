import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:profile/Core/Static/static.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: Static .mainPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(7),
                    topEnd: Radius.circular(7),
                    topStart: Radius.circular(7)),
                color: Color(0xffD3308B)),
            child: Text(controller.homeData.welcome,
                style: const TextStyle(
                    fontFamily: "hanimation",
                    fontSize: 18,
                    color: Colors.white)),
          ),
          Text("im".tr + controller.homeData.myName,
              style: const TextStyle(
                fontFamily: "hanimation",
                fontSize: 30,
                color: Colors.black,
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(children: [
                Text(
                  "${controller.homeData.specialization}  ",
                  style: const TextStyle(
                      fontFamily: "hanimation",
                      fontSize: 18,
                      color: Colors.black),
                ),
                const FlutterLogo(
                  size: 25,
                )
              ])),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 250,
            child: const Divider(
              color: Colors.black,
              height: 3,
            ),
          ),
          Text(controller.myDetails,
              style: const TextStyle(
                  fontFamily: "hanimation",
                  fontSize: 17,
                  height: 1.7,
                  color: Colors.black)),
          Text(controller.homeData.aboutMe,
              style: const TextStyle(
                  fontFamily: "hanimation",
                  fontSize: 17,
                  height: 1.7,
                  color: Colors.black))
        ],
      ),
    );
  }
}
