import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.INTRODUCTION),
          color: Colors.white,
        ),
        title: const Text('Masuk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/images/Logo.png')),
              const SizedBox(
                height: 30,
              ),
              TxtField(
                controller: controller.name,
                labelName: 'Name',
                coloroff: secondary,
                coloron: primary,
                hint: 'Enter name here!',
              ),
              const SizedBox(
                height: 15,
              ),
              TxtField(
                controller: controller.email,
                labelName: 'Email',
                coloroff: secondary,
                coloron: primary,
                hint: 'Enter email here!',
              ),
              const SizedBox(
                height: 15,
              ),
              TxtField(
                controller: controller.password,
                labelName: 'Password',
                coloroff: secondary,
                coloron: primary,
                hint: 'Enter password here!',
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: BtnBlock(
          text: 'Submit',
          color: primary,
          act: () => controller.postLogin(controller.name.text.trim(),
              controller.email.text.trim(), controller.password.text),
        ),
      ),
    );
  }
}
