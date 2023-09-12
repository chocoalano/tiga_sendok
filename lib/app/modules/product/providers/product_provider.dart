import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/constant.dart';

import '../productModel.dart';
import '../productUnitId.dart';

class ProductProvider extends GetConnect {
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

  Future<List<ProductModel>> getListData(int page) async {
    final response = await get("/products?page=$page");
    final data = response.body['data'];
    return List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
  }

  Future<List<ProductUnitId>> ListUnit() async {
    final response = await get("/product_units?page=1");
    final data = response.body['data'];
    return List<ProductUnitId>.from(data.map((e) => ProductUnitId.fromJson(e)));
  }

  Future Detail(int id) async {
    var res = await get('/products/$id');
    return res;
  }

  Future Delete(int id) async {
    var res = await delete('/products/$id');
    return res;
  }

  Future create(formData) async {
    String url = '/products';
    var res = await post(url, formData);
    return res;
  }

  Future update(formData, int id) async {
    String url = '/products/$id';
    var res = await put(url, formData);
    return res;
  }
}
