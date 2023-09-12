import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/Logo.png')),
              const SizedBox(
                height: 30,
              ),
              BtnBlock(
                text: 'Daftar Sekarang',
                color: primary,
                act: () => Get.offAllNamed(Routes.DAFTAR),
              ),
              const SizedBox(
                height: 10,
              ),
              BtnBlock(
                text: 'Masuk Sekarang',
                color: secondary,
                act: () => Get.offAllNamed(Routes.LOGIN),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
