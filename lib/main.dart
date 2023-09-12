import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/home/views/home_view.dart';
import 'app/modules/login/controllers/login_controller.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    return FutureBuilder(
      future: loginC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: loginC.isAuth.isTrue ? HomeView() : LoginView(),
              getPages: AppPages.routes,
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
