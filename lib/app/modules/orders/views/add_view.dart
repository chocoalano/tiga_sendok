import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../../../components/BtnBlock.dart';
import '../controllers/add_controller.dart';
import 'components/selectCsAdd.dart';
import 'components/selectPrAdd.dart';

class AddOrdersView extends GetView {
  const AddOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.ORDERS),
          color: Colors.white,
        ),
        backgroundColor: primary,
        title: const Text('Tambah Pesanan'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              const SelectCsAdd(),
              const SizedBox(
                height: 10,
              ),
              const SelectPrAdd(),
              const SizedBox(
                height: 10,
              ),
              TxtField(
                controller: controller.qty,
                labelName: 'QTY',
                coloroff: secondary,
                coloron: primary,
                hint: 'Enter QTY here!',
              ),
              const SizedBox(
                height: 10,
              ),
              TxtField(
                controller: controller.price,
                labelName: 'Price',
                coloroff: secondary,
                coloron: primary,
                hint: 'Enter price here!',
              ),
            ],
          ),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: BtnBlock(
          text: 'Submit',
          color: primary,
          act: () =>
              controller.store(controller.qty.text, controller.price.text),
        ),
      ),
    );
  }
}
