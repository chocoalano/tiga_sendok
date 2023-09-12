import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiga_sendok/constant.dart';

import '../CustomersModel.dart';
import '../providers/CustomersProvider.dart';

class CustomersController extends GetxController {
  CustomersProvider provider = Get.put(CustomersProvider());
  var loadingData = false.obs;
  int page = 1;
  var hasMore = true.obs;
  var dataList = <CustomersModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  void getData() async {
    try {
      loadingData(true);
      List<CustomersModel> response = await provider.getListData(page);
      print(page);
      if (response.length < 12) {
        hasMore.value = false;
      }
      dataList.addAll(response);
      page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loadingData(false);
    }
  }

  void delete(int id) async {
    var res = await provider.Delete(id);
    if (res.statusCode == 204) {
      Get.snackbar(
        'Berhasil',
        'Data Dihapus',
        colorText: Colors.white,
        backgroundColor: success,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      );
      refreshData();
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

  void refreshData() async {
    page = 1;
    hasMore.value = true;
    dataList.value = [];
    getData();
  }
}
