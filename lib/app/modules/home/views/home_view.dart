import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/components/CardGrid.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Beranda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/Logo.png')),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardGrid(
                        act: () => Get.offAllNamed(Routes.PRODUCT),
                        color: Color.fromARGB(255, 230, 230, 230),
                        icon: const Icon(Icons.shopping_bag, size: 30),
                        text: 'Manage Product',
                      ),
                      CardGrid(
                        act: () => Get.offAllNamed(Routes.ORDERS),
                        color: Color.fromARGB(255, 230, 230, 230),
                        icon: const Icon(Icons.shopping_cart, size: 30),
                        text: 'Manage Orders',
                      ),
                      CardGrid(
                        act: () => Get.offAllNamed(Routes.CUSTOMERS),
                        color: Color.fromARGB(255, 230, 230, 230),
                        icon: const Icon(Icons.groups, size: 30),
                        text: 'Manage Customers',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: BtnBlock(
          text: 'Logout',
          color: primary,
          act: () => controller.logout(),
        ),
      ),
    );
  }
}
