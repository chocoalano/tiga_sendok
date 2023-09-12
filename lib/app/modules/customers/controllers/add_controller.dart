import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../providers/CustomersProvider.dart';

class AddController extends GetxController {
  CustomersProvider provider = Get.put(CustomersProvider());
  var gender = ''.obs;
  late TextEditingController name;
  late TextEditingController phone;
  @override
  void onInit() async {
    super.onInit();
    name = TextEditingController();
    phone = TextEditingController();
  }

  void store(String name, String gender, String phone) async {
    var dataPost = jsonEncode({'name': name, 'gender': gender, 'phone': phone});
    print(dataPost);
    var res = await provider.create(dataPost);
    if (res.statusCode == 201) {
      Get.snackbar(
        'Berhasil',
        'Data Diperbaharui',
        colorText: Colors.white,
        backgroundColor: success,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(Routes.CUSTOMERS);
    } else {
      var parsed = json.decode(res.bodyString);
      Get.snackbar(
        'Terjadi Kesalahan!',
        parsed.toString(),
        colorText: Colors.white,
        backgroundColor: danger,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      );
    }
  }
}
