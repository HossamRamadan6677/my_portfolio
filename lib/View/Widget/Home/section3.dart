import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:profile/Core/assets/image_asset.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class Section3 extends StatelessWidget {
  Section3({super.key});
  HomeController homeController = Get.find();
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
              homeController.homeData.myWorks,
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
                  3,
                  (index) => ResponsiveRowColumnItem(
                          child: InkWell(
                        onTap: () {},
                        child: Neumorphic(
                          margin: const EdgeInsets.all(10),
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                              depth: 8,
                              lightSource: LightSource.topLeft,
                              color: Colors.white),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      ImageAsset.noProject,
                                    ))),
                          ),
                        ),
                      ))),
            ),
          ],
        ),
      );
}
