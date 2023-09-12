import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../providers/daftar_provider.dart';

class DaftarController extends GetxController {
  DaftarProvider provider = Get.put(DaftarProvider());
  final getstorage = GetStorage();
  var loading = false.obs;
  var isAuth = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  void submit(String name, String email, String password) async {
    try {
      loading(true);
      var dataPost =
          jsonEncode({'name': name, 'email': email, 'password': password});
      var res = await provider.postForm(dataPost);
      var parsed = json.decode(res.bodyString);
      if (parsed['message'] == 'success') {
        getstorage.write('auth', {
          "type": parsed['token_type'],
          "token": parsed['access_token'],
        });
        getstorage.write('client', {
          "id": parsed['user']["id"],
          "name": parsed['user']["name"],
          "email": parsed['user']["email"],
        });
        isAuth(true);
        Get.offAllNamed(Routes.HOME);
      } else {
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
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loading(false);
    }
  }
}
