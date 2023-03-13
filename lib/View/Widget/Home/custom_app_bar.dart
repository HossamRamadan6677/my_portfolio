import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart'; 
import 'package:responsive_framework/responsive_framework.dart' as res;
import '../../../Core/Static/static.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Container(
      padding: Static .mainPadding(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          res.ResponsiveVisibility(
            replacement: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.white,
                  size: 30,
                )),
            visible: true,
            hiddenWhen: const [res.Condition.smallerThan(name: res.TABLET)],
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ...List.generate(
                  controller.homeData.headerActionButtonsTitles.length,
                  (index) => TextButton(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            controller
                                .homeData.headerActionButtonsTitles[index],
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                        onPressed: () => controller.goToSection(index: index),
                      )),
              InkWell(
                onTap: () => controller.toggleLocale(),
                child: Row(
                  children: [
                    Text(
                      'otherLanguage'.tr,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      FontAwesomeIcons.globe,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ]),
          ),
          const Spacer(),
          Text(
            controller.homeData.title,
            style: const TextStyle(
                color: Colors.white, fontFamily: "hanimation", fontSize: 33),
          ),
        ],
      ),
    );
  }
}
