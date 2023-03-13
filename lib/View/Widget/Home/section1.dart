import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:profile/Core/values/values.dart';
import 'package:profile/View/Widget/Home/custom_app_bar.dart';
import 'package:profile/View/Widget/Home/social_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Section1 extends GetView<HomeController> {
  const Section1({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomAppBar(),
        Column(
          children: <Widget>[
            Text(
              controller.homeData.welcome,
              style: const TextStyle(
                  color: Colors.white, fontSize: 28, fontFamily: "hanimation"),
            ),
            Text(
              controller.homeData.myName,
              style: const TextStyle(
                  color: Colors.white, fontSize: 35, fontFamily: "hanimation"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                    icon: FontAwesomeIcons.squareFacebook,
                    onTap: () =>
                        controller.openSocialProfile(Values.facebookUrl)),
                SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    onTap: () =>
                        controller.openSocialProfile(Values.instagramUrl)),
                SocialButton(
                    icon: FontAwesomeIcons.twitter,
                    onTap: () =>
                        controller.openSocialProfile(Values.twitterUrl)),
                SocialButton(
                    icon: FontAwesomeIcons.github,
                    onTap: () =>
                        controller.openSocialProfile(Values.githubUrl)),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}
