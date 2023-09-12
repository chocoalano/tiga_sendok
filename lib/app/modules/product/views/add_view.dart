import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/components/BtnBlock.dart';
import 'package:tiga_sendok/app/components/TxtField.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AddController controller = Get.put(AddController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.PRODUCT),
          color: Colors.white,
        ),
        backgroundColor: primary,
        title: const Text('Perbaharui Data'),
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
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Unit ID',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Obx(() => ListView.builder(
                              itemCount: controller.dataUnit.length,
                              itemBuilder: (context, index) {
                                if (index < controller.dataUnit.length) {
                                  return Obx(() => RadioListTile(
                                        title: Text(
                                            controller.dataUnit[index].name),
                                        value: controller.dataUnit[index].id,
                                        groupValue: controller.unit_id.value,
                                        onChanged: (value) =>
                                            controller.unit_id(value as int?),
                                      ));
                                } else {
                                  return const Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: primary,
                                      ),
                                    ),
                                  );
                                }
                              },
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TxtField(
                  controller: controller.price,
                  labelName: 'Price',
                  coloroff: secondary,
                  coloron: primary,
                  hint: 'Enter price here!',
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
          act: () =>
              controller.store(controller.name.text, controller.price.text),
        ),
      ),
    );
  }
}
