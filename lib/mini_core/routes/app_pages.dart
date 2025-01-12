// lib/core/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:weather_task/di.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/detail/detail_screen.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/home_screen.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/search/search_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),

    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsPage(),
 
    ),
  ];
}