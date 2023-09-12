import 'package:get/get.dart';

import '../../customers/controllers/customers_controller.dart';
import '../controllers/add_controller.dart';
import '../controllers/edit_controller.dart';
import '../controllers/orders_controller.dart';
import '../controllers/ordersunpaid_controller.dart';
import '../providers/OrderProvider.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(),
    );
    Get.lazyPut<OrderProvider>(
      () => OrderProvider(),
    );
  }
}

class OrdersUnpaidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersUnpaidController>(
      () => OrdersUnpaidController(),
    );
    Get.lazyPut<OrderProvider>(
      () => OrderProvider(),
    );
  }
}

class AddOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(
      () => AddController(),
    );
    Get.lazyPut<OrderProvider>(
      () => OrderProvider(),
    );
  }
}

class EditOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(
      () => EditController(),
    );
    Get.lazyPut<CustomersController>(
      () => CustomersController(),
    );
    Get.lazyPut<OrderProvider>(
      () => OrderProvider(),
    );
  }
}
