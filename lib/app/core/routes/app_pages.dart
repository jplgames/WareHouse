// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:myapp/app/modules/login/bindings/login_binding.dart';
import 'package:myapp/app/modules/login/views/login_view.dart';

import 'package:myapp/app/modules/splash/binding/splash_binding.dart';
import 'package:myapp/app/modules/splash/views/splash_view.dart';
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
  ];
}
