import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:profile/View/Widget/Home/drawer_content.dart';
import 'package:profile/View/Widget/Home/section3.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../Widget/Home/section1.dart';
import '../Widget/Home/section2.dart';
import '../Widget/Home/section4.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: GetBuilder<HomeController>(builder: (controller) {
          return controller.scrollValue > 400
              ? FloatingActionButton(
                  backgroundColor: const Color(0xffD3308B),
                  onPressed: () {
                    Get.log.call(controller.scrollValue.toString());
                    controller.goToSection(index: 0);
                  },
                  child: const Icon(FontAwesomeIcons.arrowUp))
              : Container();
        }),
        drawer: ResponsiveWrapper.of(context).isLargerThan(TABLET)
            ? null
            : const DrawerContent(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        controller.homeData.mainBG,
                      ),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.grey.shade600, BlendMode.modulate))),
            ),
            NotificationListener<ScrollNotification>(
              onNotification: (scroll) {
                if (scroll is ScrollUpdateNotification) {
                  controller.scrollValue =
                      controller.homeScrollController.offset;
                  if (controller.scrollValue < 820) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                  controller.update();
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: controller.homeScrollController,
                child: Column(
                  children: [
                    Section1(key: controller.section1),
                    Section2(key: controller.section2),
                    Section3(key: controller.section3),
                    Section4(key: controller.section4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
