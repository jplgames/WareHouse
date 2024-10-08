// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';

import '../../modules/store/bindings/store_binding.dart';
import '../../modules/store/views/store_view.dart';
import '../../modules/clients/bindings/clients_binding.dart';
import '../../modules/clients/views/clients_view.dart';
import '../../modules/products/binding/products_binding.dart';
import '../../modules/products/views/products_view.dart';
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/views/login_view.dart';
import '../../modules/register/bindings/register_binding.dart';
import '../../modules/register/views/register_view.dart';
import '../../modules/splash/binding/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';
import '../../modules/home/binding/home_binding.dart';
import '../../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.REGISTER,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: _Paths.PRODUCTS,
        page: () => ProductsView(),
        binding: ProductsBinding()),
    GetPage(
        name: _Paths.CLIENTS,
        page: () => ClientsView(),
        binding: ClientsBinding()),
    GetPage(
        name: _Paths.STORE, 
        page: () => StoreView(), 
        binding: StoreBinding())
  ];
}
