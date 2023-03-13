import 'package:get/get.dart';
import '../../View/Screen/home.dart';

List<GetPage> routes = [
  GetPage(name: AppRoutes.home, page: () => const Home()),
];

class AppRoutes {
  static const String home = "/";
}
