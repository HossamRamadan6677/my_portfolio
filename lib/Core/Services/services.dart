import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Localization/dictionary.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Services> sharedPreferencesPut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() async => Services().sharedPreferencesPut());
  Get.put(DictionaryController());
}
