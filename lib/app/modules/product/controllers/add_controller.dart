import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../productUnitId.dart';
import '../providers/product_provider.dart';

class AddController extends GetxController {
  ProductProvider provider = Get.put(ProductProvider());
  final unit_id = 0.obs;

  var dataUnit = <ProductUnitId>[].obs;

  late TextEditingController name;
  late TextEditingController price;
  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    price = TextEditingController();
    getUnit();
  }

  void getUnit() async {
    try {
      List<ProductUnitId> response = await provider.ListUnit();
      dataUnit.addAll(response);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  void store(String name, String price) async {
    var dataPost = jsonEncode(
        {'name': name, 'unit_id': unit_id.value, 'price': double.parse(price)});
    var res = await provider.create(dataPost);
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
      Get.offAllNamed(Routes.PRODUCT);
    } else {
      var parsed = json.decode(res.bodyString);
      print(parsed);
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
