import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/add_controller.dart';

class AddCustomersView extends GetView<AddController> {
  const AddCustomersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> datagender = ["female", "male", "other"];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.CUSTOMERS),
          color: Colors.white,
        ),
        backgroundColor: primary,
        title: const Text('Tambah Pelanggan'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              children: [
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
                  controller: controller.phone,
                  labelName: 'Phone',
                  coloroff: secondary,
                  coloron: primary,
                  hint: 'Enter phone here!',
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: datagender.length,
                          itemBuilder: (context, index) {
                            return Obx(() => RadioListTile(
                                  title: Text(datagender[index]),
                                  value: datagender[index],
                                  groupValue: controller.gender.value,
                                  onChanged: (value) => controller
                                      .gender.value = value.toString(),
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
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
          act: () => controller.store(controller.name.text,
              controller.gender.value, controller.phone.text),
        ),
      ),
    );
  }
}
