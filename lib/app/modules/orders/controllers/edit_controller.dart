import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../../customers/CustomersModel.dart';
import '../../product/productModel.dart';
import '../providers/OrderProvider.dart';

class EditController extends GetxController {
  dynamic id = Get.arguments;
  OrderProvider provider = Get.put(OrderProvider());
  List dataListCS = <CustomersModel>[].obs;
  List dataListPr = <ProductModel>[].obs;
  var loadingCS = false.obs;
  var loadingPR = false.obs;

  var customer_id = ''.obs;
  var product_id = ''.obs;

  TextEditingController qty = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    qty = TextEditingController();
    price = TextEditingController();
    GetDataCS();
    GetDataPR();
    GetDataEdit();
  }

  void GetDataCS() async {
    try {
      loadingCS(true);
      List<CustomersModel> res = await provider.getDataCs(0);
      dataListCS.addAll(res);
      loadingCS(false);
    } catch (e) {
      print(e);
      loadingCS(false);
    }
  }

  void GetDataPR() async {
    try {
      loadingPR(true);
      List<ProductModel> res = await provider.getDataPr(0);
      dataListPr.addAll(res);
      loadingPR(false);
    } catch (e) {
      loadingPR(false);
    }
  }

  void setCs(String v) {
    customer_id(v);
  }

  void setPr(String v) {
    product_id(v);
  }

  void GetDataEdit() async {
    var res = await provider.Detail(id);
    setCs(res.body['customer']['id'].toString());
    setPr(res.body['product']['id'].toString());
    qty.text = res.body['qty'].toString();
    price.text = res.body['price'].toString();
  }

  void updateData(String qty, String price) async {
    var dataPost = jsonEncode({
      'customer_id': int.parse(customer_id.value),
      'product_id': int.parse(product_id.value),
      'qty': int.parse(qty),
      'price': double.parse(price)
    });
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
      Get.offAllNamed(Routes.ORDERS);
    } else {
      var parsed = json.decode(res.bodyString);
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

  void pay() async {
    var res = await provider.pay(id);
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
      Get.offAllNamed(Routes.ORDERS);
    } else {
      var parsed = json.decode(res.bodyString);
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
