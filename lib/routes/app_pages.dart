// ignore_for_file: constant_identifier_names

import 'package:flutter_map_test/modules/home/views/home.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeScreenBinding(),
    )
  ];
}
