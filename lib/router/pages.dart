import 'package:appez/pages/home_page.dart';
import 'package:get/get.dart';

part './routes.dart';
class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.homePage, page: () => HomePage())
  ];
}