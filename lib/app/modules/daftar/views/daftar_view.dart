import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  const DaftarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.INTRODUCTION),
          color: Colors.white,
        ),
        title: const Text('Daftar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/images/Logo.png')),
                  SizedBox(
                    height: 30,
                  ),
                  TxtField(
                    controller: controller.name,
                    labelName: 'Name',
                    coloroff: secondary,
                    coloron: primary,
                    hint: 'Enter name here!',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TxtField(
                    controller: controller.email,
                    labelName: 'Email',
                    coloroff: secondary,
                    coloron: primary,
                    hint: 'Enter email here!',
                  ),
                  SizedBox(
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
                  TxtField(
                    controller: controller.confirm_password,
                    labelName: 'Confirm Password',
                    coloroff: secondary,
                    coloron: primary,
                    hint: 'Enter confirm password here!',
                  )
                ],
              ),
            ),
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
          act: () => controller.submit(controller.name.text.trim(),
              controller.email.text.trim(), controller.password.text),
        ),
      ),
    );
  }
}
