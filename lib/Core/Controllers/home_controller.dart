import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Localization/dictionary.dart';
import 'package:profile/Models/home_model.dart';
import 'package:profile/Core/assets/image_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  @override
  void update([List<Object>? ids, bool condition = true]) {
    updateModel();
    super.update(ids, condition);
  }

  late HomeModel homeData;
  DictionaryController dictionaryController = Get.find();

  GlobalKey section1 = GlobalKey();
  GlobalKey section2 = GlobalKey();
  GlobalKey section3 = GlobalKey();
  GlobalKey section4 = GlobalKey();
  late List<GlobalKey> sectionKeys;

  late int age;
  late String myDetails;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String subjectInputValue;
  late String messageInputValue;

  ScrollController homeScrollController = ScrollController();
  double scrollValue = 0;
  List<String> myCertificationsImages = [
    ImageAsset.dartCertificate,
  ];
  List<String> myCertificationsUrl = [
    "https://www.udemy.com/certificate/UC-ee3fcf30-fc1a-451c-9b0e-66873bc17cc5/"
  ];
  openCertificateLink(int index) async {
    Uri toUri = Uri.parse(myCertificationsUrl[index]);
    if (await canLaunchUrl(toUri)) {
      await launchUrl(toUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void onInit() {
    sectionKeys = [section1, section2, section3, section4];
    updateModel();
    super.onInit();
  }

  updateModel() {
    int age =
        (DateTime.now().difference(DateTime.utc(1999, 5, 1)).inDays / 365.24)
            .floor();
    homeData = HomeModel(
        mainBG: ImageAsset.mainBg,
        title: "title".tr,
        headerActionButtonsTitles: [
          "home".tr,
          "who am i".tr,
          "my certifications".tr,
          "contact me".tr,
        ],
        welcome: "welcome".tr,
        myName: "myName".tr,
        specialization: "specialization".tr,
        aboutMe: "aboutMe".tr,
        age: "age".tr,
        myAge: age,
        address: "address".tr,
        myAddress: "myAddress".tr,
        email: "email".tr,
        myEmail: "HossamRamadan6677@gmail.com",
        phone: "phone".tr,
        myPhone: "01148183794",
        myCertification: "my certifications".tr,
        contactMe: "contactMe".tr,
        subject: "subject".tr,
        clear: "clear".tr,
        message: "message".tr,
        send: "send".tr);
    myDetails = """
${homeData.age} : ${homeData.myAge} 
${homeData.address} : ${homeData.myAddress} 
${homeData.email} : ${homeData.myEmail}
${homeData.phone} : ${homeData.myPhone}
""";
  }

  openSocialProfile(String url) async {
    Uri toUri = Uri.parse(url);
    if (await canLaunchUrl(toUri)) {
      await launchUrl(toUri, mode: LaunchMode.externalApplication);
    }
  }

  toggleLocale({BuildContext? context}) {
    if (context != null) {
      Scaffold.of(context).closeDrawer();
    }
    Get.locale.toString() == "ar"
        ? dictionaryController.changeLocale("en")
        : dictionaryController.changeLocale("ar");
    update();
  }

  goToSection({BuildContext? context, required int index}) {
    if (context != null) {
      Scaffold.of(context).closeDrawer();
    }
    Scrollable.ensureVisible(sectionKeys[index].currentContext!);
  }

  sendEmail() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      String myEmail = "hossamramadan6677@gmail.com";
      final Uri url = Uri.parse(
          "mailto:$myEmail?subject=${Uri.encodeFull(subjectInputValue)}&body=${Uri.encodeFull(messageInputValue)}");
      Get.log.call(url.toString());
      if (await canLaunchUrl(url)) await launchUrl(url);
    }
  }
}
