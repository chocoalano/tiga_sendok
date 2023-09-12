import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../providers/login_provider.dart';

class LoginController extends GetxController {
  LoginProvider provider = Get.put(LoginProvider());
  final getstorage = GetStorage();
  var loading = false.obs;
  var isAuth = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void postLogin(String name, String email, String password) async {
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
          "password": password,
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

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("client") != null) {
      final data = box.read("client") as Map<String, dynamic>;
      if (data["name"] != null &&
          data["email"] != null &&
          data["password"] != null) {
        postLogin(data["name"], data["email"], data["password"]);
      }
    }
  }
}
