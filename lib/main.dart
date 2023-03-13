import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Services/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Core/Localization/dictionary.dart';
import 'Core/Routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // ignore: avoid_print
  print('');
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 2000,
        minWidth: 350,
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP)
        ],
      ),
            debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      locale: Get.locale,
      getPages: routes,
      translations: Dictionary(),
    );
  }
}
