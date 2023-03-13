import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
