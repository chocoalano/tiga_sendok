import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/edit_controller.dart';

class SelectPr extends StatelessWidget {
  const SelectPr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: Text(
            'Produk',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: Obx(() {
            if (controller.loadingPR.isFalse) {
              return Container(
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: Obx(() => Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            value: controller.product_id.value == ''
                                ? null
                                : controller.product_id.value,
                            items: controller.dataListPr
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text(e.name,
                                          textAlign: TextAlign.center),
                                    ))
                                .toList(),
                            onChanged: (v) => controller.setPr(v!),
                            icon: const Icon(Icons.arrow_circle_down_sharp)),
                      )));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ],
    );
  }
}
