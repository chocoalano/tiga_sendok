import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
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
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () => Get.offAllNamed(Routes.PRODUCTADD),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        backgroundColor: primary,
        title: const Text('Produk'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: Obx(() => ListView.builder(
                controller: scrollController,
                itemCount: controller.hasMore.value
                    ? controller.dataproduck.length + 1
                    : controller.dataproduck.length,
                itemBuilder: (context, index) {
                  if (index < controller.dataproduck.length) {
                    return ListTile(
                      title: Center(
                          child: Text(controller.dataproduck[index].code)),
                      subtitle: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.dataproduck[index].name),
                          Text(
                            'Rp. ${controller.dataproduck[index].price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                      leading: IconButton(
                          onPressed: () => controller
                              .delete(controller.dataproduck[index].id),
                          icon: const Icon(
                            Icons.delete,
                            size: 20,
                          )),
                      trailing: IconButton(
                          onPressed: () => Get.offAllNamed(Routes.PRODUCTEDIT,
                              arguments:
                                  controller.dataproduck[index].id.toInt()),
                          icon: const Icon(
                            Icons.edit,
                            size: 20,
                          )),
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
