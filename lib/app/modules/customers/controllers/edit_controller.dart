import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../providers/CustomersProvider.dart';

class EditController extends GetxController {
  dynamic id = Get.arguments;
  CustomersProvider provider = Get.put(CustomersProvider());
  var loadingData = false.obs;
  var gender = ''.obs;
  late TextEditingController name;
  late TextEditingController phone;
  @override
  void onInit() async {
    super.onInit();
    name = TextEditingController();
    phone = TextEditingController();
    var res = await provider.Detail(id);
    name.text = res.body['name'];
    gender.value = res.body['gender'];
    phone.text = res.body['phone'];
  }

  void updateData(String name, String gender, String phone) async {
    var dataPost = jsonEncode({'name': name, 'gender': gender, 'phone': phone});
    var res = await provider.update(dataPost, id);
    if (res.statusCode == 200) {
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
      print(parsed);
      Get.snackbar(
        'Terjadi Kesalahan!',
        '${parsed.toString()}, pastikan inputan no telepon dengan format valid! contoh benar: xxxxxxxxxx, contoh salah:(xxx)xxx-xxxx.',
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
