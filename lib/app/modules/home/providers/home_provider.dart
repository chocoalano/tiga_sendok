import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/constant.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    final ls = GetStorage();
    final lsdata = ls.read("auth") as Map<String, dynamic>;
    final token = lsdata['token'];
    httpClient.baseUrl = base_Url;
    httpClient.defaultContentType = "application/json";
    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers["Authorization"] = "Bearer $token";
      return request;
    });
  }

  Future logout() async {
    var res = await get('/logout');
    return res;
  }
}
