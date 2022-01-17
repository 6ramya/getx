import 'package:get/instance_manager.dart';
import 'package:getx_demo/core/repository/news_repo_impl.dart';
import 'package:getx_demo/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
