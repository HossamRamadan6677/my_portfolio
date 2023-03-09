import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart'; 
import 'package:responsive_framework/responsive_framework.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
      color: Colors.white,
      width: ResponsiveWrapper.of(context).screenWidth / 1.5,
      child: ListView(children: [
        ...List.generate(
            controller.homeData.headerActionButtonsTitles.length,
            (index) => InkWell(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          controller.homeData.headerActionButtonsTitles[index],
                          style: const TextStyle(
                              fontSize: 22, color: Colors.black))),
                  onTap: () =>
                      controller.goToSection(context: context, index: index),
                )),
        InkWell(
          onTap: () => controller.toggleLocale(context: context),
          child: Row(
            children: <Widget>[
              const Icon(FontAwesomeIcons.globe),
              const SizedBox(width: 10),
              Text(
                'otherLanguage'.tr,
                style: const TextStyle(fontSize: 22, color: Colors.black),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
