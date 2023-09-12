import 'package:get/get.dart';

import '../controllers/daftar_controller.dart';
import '../providers/daftar_provider.dart';

class DaftarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarController>(
      () => DaftarController(),
    );
    Get.lazyPut<DaftarProvider>(
      () => DaftarProvider(),
    );
  }
}
