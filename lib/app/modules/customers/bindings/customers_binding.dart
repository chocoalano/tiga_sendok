import 'package:get/get.dart';

import '../controllers/add_controller.dart';
import '../controllers/customers_controller.dart';
import '../controllers/edit_controller.dart';
import '../providers/CustomersProvider.dart';

class CustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomersController>(
      () => CustomersController(),
    );
    Get.lazyPut<CustomersProvider>(
      () => CustomersProvider(),
    );
  }
}

class AddCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(
      () => AddController(),
    );
    Get.lazyPut<CustomersProvider>(
      () => CustomersProvider(),
    );
  }
}

class EditCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(
      () => EditController(),
    );
    Get.lazyPut<CustomersProvider>(
      () => CustomersProvider(),
    );
  }
}
