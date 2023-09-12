import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/edit_controller.dart';
import 'components/selectCs.dart';
import 'components/selectPr.dart';

class EditOrdersView extends GetView<EditController> {
  const EditOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.ORDERS),
          color: Colors.white,
        ),
        backgroundColor: primary,
        title: const Text('Perbaharui Pesanan'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              SelectCs(),
              const SizedBox(
                height: 10,
              ),
              SelectPr(),
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
        height: 150,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: primary,
                    padding: EdgeInsets.only(left: 50, right: 50)),
                onPressed: () => controller.updateData(
                    controller.qty.text, controller.price.text),
                icon: Icon(Icons.save),
                label: Text('Submit')),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: success,
                    padding: EdgeInsets.only(left: 50, right: 50)),
                onPressed: () => controller.pay(),
                icon: Icon(Icons.payment),
                label: Text('Pay')),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: danger,
                    padding: EdgeInsets.only(left: 50, right: 50)),
                onPressed: () => Get.offAllNamed(Routes.ORDERSUNPAID),
                icon: Icon(Icons.payments),
                label: Text('Unpaid')),
          ],
        ),
      ),
    );
  }
}
