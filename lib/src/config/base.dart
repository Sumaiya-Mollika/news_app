import 'package:get/get.dart';
import 'package:news_app/src/controllers/auth_controller.dart';
import 'package:news_app/src/controllers/news_controller.dart';

class Base {
  final authC = Get.put(AuthenticationController());
  final newsC = Get.put(NewsController());
}
