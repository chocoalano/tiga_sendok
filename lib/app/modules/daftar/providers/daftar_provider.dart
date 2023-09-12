import 'package:get/get.dart';
import 'package:tiga_sendok/constant.dart';

class DaftarProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = base_Url;
  }

  Future postForm(formData) async {
    String url = '/register';
    var res = await post(url, formData);
    return res;
  }
}
