import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiga_sendok/app/routes/app_pages.dart';
import 'package:tiga_sendok/constant.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({Key? key}) : super(key: key);
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
              onPressed: () => Get.offAllNamed(Routes.CUSTOMERSADD),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        backgroundColor: primary,
        title: const Text('Pelanggan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: Obx(() => ListView.builder(
                controller: scrollController,
                itemCount: controller.hasMore.value
                    ? controller.dataList.length + 1
                    : controller.dataList.length,
                itemBuilder: (context, index) {
                  if (index < controller.dataList.length) {
                    return ListTile(
                      title: Text(controller.dataList[index].name),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.dataList[index].gender.toString()),
                          Text(
                            controller.dataList[index].phone,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () => Get.offAllNamed(
                                  Routes.CUSTOMERSEDIT,
                                  arguments:
                                      controller.dataList[index].id.toInt()),
                              icon: const Icon(
                                Icons.edit,
                                size: 20,
                              )),
                          IconButton(
                              // ignore: avoid_print
                              onPressed: () => controller
                                  .delete(controller.dataList[index].id),
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                              ))
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
