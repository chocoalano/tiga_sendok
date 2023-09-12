import 'package:get/get.dart';

import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/views/add_view.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/customers/views/edit_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/add_view.dart';
import '../modules/orders/views/edit_view.dart';
import '../modules/orders/views/ordersUnpaid_view.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/edit_view.dart';
import '../modules/product/views/add_view.dart';
import '../modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const START = Routes.INTRODUCTION;

  static final routes = [
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.DAFTAR,
        page: () => const DaftarView(),
        binding: DaftarBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PRODUCT,
        page: () => const ProductView(),
        binding: ProductBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PRODUCTADD,
        page: () => const AddView(),
        binding: AddProductBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PRODUCTEDIT,
        page: () => const EditView(),
        binding: EditProductBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ORDERS,
        page: () => const OrdersView(),
        binding: OrdersBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ORDERSADD,
        page: () => const AddOrdersView(),
        binding: AddOrdersBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ORDERSEDIT,
        page: () => const EditOrdersView(),
        binding: EditOrdersBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ORDERSUNPAID,
        page: () => const OrdersUnpaid_view(),
        binding: OrdersUnpaidBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.CUSTOMERS,
        page: () => const CustomersView(),
        binding: CustomersBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.CUSTOMERSADD,
        page: () => const AddCustomersView(),
        binding: AddCustomersBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.CUSTOMERSEDIT,
        page: () => const EditCustomersView(),
        binding: EditCustomersBinding(),
        transition: Transition.noTransition),
  ];
}
