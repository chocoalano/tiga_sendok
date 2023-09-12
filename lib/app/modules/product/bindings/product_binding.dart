import 'package:get/get.dart';

import '../controllers/add_controller.dart';
import '../controllers/edit_controller.dart';
import '../controllers/product_controller.dart';
import '../providers/product_provider.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  }
}

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(
      () => AddController(),
    );
    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  }
}

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(
      () => EditController(),
    );
    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  }
}
