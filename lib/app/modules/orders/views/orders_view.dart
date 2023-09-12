import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    Future onRefresh() async {
      controller.refreshData();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && controller.hasMore.value) {
        controller.getData();
      }
    }

    scrollController.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () => Get.offAllNamed(Routes.ORDERSADD),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        backgroundColor: primary,
        title: const Text('Pesanan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: Obx(() => ListView.builder(
                controller: scrollController,
                itemCount: controller.hasMore.value
                    ? controller.dataList.length + 1
                    : controller.dataList.length,
                itemBuilder: (context, index) {
                  if (index < controller.dataList.length) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('QTY'),
                                    Text(controller.dataList[index].qty
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Harga'),
                                    Text(
                                        'Rp. ${controller.dataList[index].price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total'),
                                    Text(
                                        'Rp. ${controller.dataList[index].total.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}'),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.dataList[index].customer.name),
                                Text(controller.dataList[index].customer.phone),
                                Text(
                                  controller.dataList[index].product.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Row(
                            children: [
                              TextButton.icon(
                                  onPressed: () => Get.offAllNamed(
                                      Routes.ORDERSEDIT,
                                      arguments: controller.dataList[index].id
                                          .toInt()),
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                  label: const Text(
                                    'Perbaharui',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              TextButton.icon(
                                  onPressed: () => controller
                                      .delete(controller.dataList[index].id),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: danger,
                                  ),
                                  label: const Text(
                                    'Hapus',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: danger),
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
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
                }))),
      ),
    );
  }
}
