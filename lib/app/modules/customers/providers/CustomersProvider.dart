import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/constant.dart';

import '../CustomersModel.dart';

class CustomersProvider extends GetConnect {
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

  Future<List<CustomersModel>> getListData(int page) async {
    final response = await get("/customers?page=$page");
    final data = response.body['data'];
    return List<CustomersModel>.from(
        data.map((e) => CustomersModel.fromJson(e)));
  }

  Future Detail(int id) async {
    var res = await get('/customers/$id');
    return res;
  }

  Future Delete(int id) async {
    var res = await delete('/customers/$id');
    return res;
  }

  Future create(formData) async {
    String url = '/customers';
    var res = await post(url, formData);
    return res;
  }

  Future update(formData, int id) async {
    String url = '/customers/$id';
    var res = await put(url, formData);
    return res;
  }
}
