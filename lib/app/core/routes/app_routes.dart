part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PRODUCTS = _Paths.PRODUCTS;
  static const CLIENTS = _Paths.CLIENTS;
  static const STORE = _Paths.STORE;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const PRODUCTS = '/products';
  static const CLIENTS = '/clients';
  static const STORE = '/store';
}
