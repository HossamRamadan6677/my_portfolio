import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Section3 extends GetView<HomeController> {
  const Section3({super.key});
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              controller.homeData.myCertification,
              style: const TextStyle(
                  fontFamily: "hanimation", fontSize: 30, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ResponsiveRowColumn(
              rowMainAxisAlignment: MainAxisAlignment.center,
              layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: List.generate(
                  controller.myCertificationsImages.length,
                  (index) => ResponsiveRowColumnItem(
                        child: InkWell(
                          onTap: () => controller.openCertificateLink(index),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(12)),
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Colors.white),
                            child: Container(
                              alignment: Alignment.bottomRight,
                              width: ResponsiveWrapper.of(context)
                                      .isLargerThan(MOBILE)
                                  ? 300
                                  : 200,
                              height: ResponsiveWrapper.of(context)
                                      .isLargerThan(MOBILE)
                                  ? 300
                                  : 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(controller
                                        .myCertificationsImages[index])),
                              ),
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Dart-logo-icon.svg/2048px-Dart-logo-icon.svg.png",
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      );
}
