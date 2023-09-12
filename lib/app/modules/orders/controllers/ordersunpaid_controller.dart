import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../UnpaidOrderModel.dart';
import '../providers/OrderProvider.dart';

class OrdersUnpaidController extends GetxController {
  OrderProvider provider = Get.put(OrderProvider());
  var loadingData = false.obs;
  int page = 1;
  var hasMore = true.obs;
  var dataList = <UnpaidOrderModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  void getData() async {
    try {
      loadingData(true);
      List<UnpaidOrderModel> response = await provider.getUnpaid(page);
      print(page);
      if (response.length < 12) {
        hasMore.value = false;
      }
      dataList.addAll(response);
      page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loadingData(false);
    }
  }

  void refreshData() async {
    page = 1;
    hasMore.value = true;
    dataList.value = [];
    getData();
  }
}
