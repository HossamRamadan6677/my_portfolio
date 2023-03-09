import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Services/services.dart';

class Dictionary extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          'otherLanguage': 'English',
          "title": "بروفايل",
          "home": "الرئيسيه",
          "who am i": "من انا",
          "my works": "أعمالي",
          "contact me": "تواصل معي",
          "welcome": "مرحبا بكم",
          "myName": "حسام رمضان",
          "specialization": "مطور فلاتر",
          "age": "الـعـمــر",
          "address": "العنوان",
          "myAddress": "مصر القاهرة حلوان",
          "email": "الــبـريـد",
          "phone": "الهاتف",
          "services": "خدماتي",
          "PartOfMyWorks": "جزء من اعمالي", 
          "contactMe": "تواصل معي",
          "im": "أنا ",
          "aboutMe": '''
مهاراتي في فلاتر
  - Firebase
  - Api Knowledge
  
إطارات العمل
  - Using GetX state-management
  - responsive_framework 

''',
          "subject": "الموضوع",
          "clear": "مسح الكل",
          "message": "الرساله",
          "send": 'إرسال',
          "emptySubject": "من فضلك ادخل موضوع الرساله",
          "emptyMessage": "من فضلك ادخل الرساله",
        },
        "en": {
          'otherLanguage': 'العربيه',
          "title": "Profile",
          "home": "Home",
          "who am i": "Who am i",
          "my services": "My services ",
          "my works": "My works",
          "contact me": "Contact me",
          "welcome": "Welcome",
          "myName": "Hossam Ramadan",
          "specialization": "Flutter Developer",
          "age": "Age",
          "address": "Address",
          "myAddress": "Egypt Cairo, Helwan",
          "email": "Email",
          "phone": "Phone",
          "services": "Services",
          "PartOfMyWorks": "Part of my works",
 
   
          "contactMe": "Contact me",
          "im": "I'm ",
          "aboutMe": '''
my Flutter Development Skills
  - Firebase
  - Api Knowledge
  
Frameworks 
  - Using GetX state-management  
  - responsive_framework 
''',
          "subject": "Subject",
          "clear": "Clear",
          "message": "Message",
          "send": "Send",
          "emptySubject": "Please Enter Subject",
          "emptyMessage": "Please Enter Message",
        }
      };
}

class DictionaryController extends GetxController {
  Services services = Get.find();
  late String currentLanguageCode;

  @override
  void onInit() {
    services.sharedPreferences.getString("locale") != null
        ? currentLanguageCode = services.sharedPreferences.getString("locale")!
        : currentLanguageCode = Get.deviceLocale.toString();
 
    Get.updateLocale(Locale(currentLanguageCode));
    super.onInit();
  }

  changeLocale(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    services.sharedPreferences.setString("locale", langCode);
  }
}
