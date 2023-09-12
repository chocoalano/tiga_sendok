import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tiga_sendok/constant.dart';
import '../../customers/CustomersModel.dart';
import '../../product/productModel.dart';
import '../OrdersModel.dart';
import '../UnpaidOrderModel.dart';

class OrderProvider extends GetConnect {
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

  Future<List<OrdersModel>> getListData(int page) async {
    final response = await get("/orders?page=$page");
    final data = response.body['data'];
    return List<OrdersModel>.from(data.map((e) => OrdersModel.fromJson(e)));
  }

  Future<List<CustomersModel>> getDataCs(int page) async {
    final response = await get("/customers?paginate=$page");
    final data = response.body;
    return List<CustomersModel>.from(
        data.map((e) => CustomersModel.fromJson(e)));
  }

  Future<List<ProductModel>> getDataPr(int page) async {
    final response = await get("/products?paginate=$page");
    final data = response.body;
    return List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
  }

  Future Detail(int id) async {
    var res = await get('/orders/$id');
    return res;
  }

  Future Delete(int id) async {
    var res = await delete('/orders/$id');
    return res;
  }

  Future create(formData) async {
    String url = '/orders';
    var res = await post(url, formData);
    return res;
  }

  Future update(formData, int id) async {
    String url = '/orders/$id';
    var res = await put(url, formData);
    return res;
  }

  Future pay(int id) async {
    String url = '/orders/$id/pay';
    var res = await put(url, {});
    return res;
  }

  Future<List<UnpaidOrderModel>> getUnpaid(int page) async {
    final response = await get("/orders?status=unpaid&page=$page");
    final data = response.body['data'];
    return List<UnpaidOrderModel>.from(
        data.map((e) => UnpaidOrderModel.fromJson(e)));
  }
}
