import 'package:profile/Core/Localization/dictionary.dart';

class HomeModel extends DictionaryController {
  HomeModel({
    required this.mainBG,
    // Home
    required this.title,
    required this.headerActionButtonsTitles,
    required this.welcome,
    required this.myName,
    // section 1
    required this.specialization,
    required this.aboutMe,
    required this.age,
    required this.myAge,
    required this.address,
    required this.myAddress,
    required this.email,
    required this.myEmail,
    required this.phone,
    required this.myPhone,
    required this.myCertification,

    // section 4
    required this.contactMe,
    required this.subject,
    required this.message,
    required this.clear,
    required this.send,
  });
  // Home
  String mainBG;
  String myName;
  String title;
  List headerActionButtonsTitles;
  String welcome;

  // section 1
  String specialization;
  String aboutMe;
  String age;
  String address;
  String email;
  String phone;
  int myAge;
  String myAddress;
  String myEmail;
  String myPhone;
  // section 3
  String myCertification;

  // Section4
  String contactMe;
  String subject;
  String message;
  String clear;
  String send;
}
