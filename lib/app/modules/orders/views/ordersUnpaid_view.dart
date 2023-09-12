import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/ordersunpaid_controller.dart';

class OrdersUnpaid_view extends GetView<OrdersUnpaidController> {
  const OrdersUnpaid_view({Key? key}) : super(key: key);
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
        backgroundColor: primary,
        title: const Text('Pesanan Unpaid'),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Status'),
                                    Text(
                                      controller.dataList[index].isPaid == 0
                                          ? 'Unpaid'
                                          : 'Paid',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: controller
                                                      .dataList[index].isPaid ==
                                                  0
                                              ? danger
                                              : success),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
