import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());

  void logout() async {
    try {
      await provider.logout();
      clearStorage();
      Get.offAllNamed(Routes.INTRODUCTION);
    } catch (e) {
      Get.snackbar(
        'Terjadi Kesalahan!',
        e.toString(),
        colorText: Colors.white,
        backgroundColor: danger,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      );
    }
  }

  void clearStorage() async {
    final box = GetStorage();
    if (box.read('auth') != null) {
      box.erase();
    }
    if (box.read('client') != null) {
      box.erase();
    }
  }
}
