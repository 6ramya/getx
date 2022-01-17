import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_demo/core/model/article_model.dart';
import 'package:getx_demo/core/repository/news_repo_impl.dart';
import 'package:getx_demo/core/repository/news_repository.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
    hideLoading();
    if (result != null) {
      articles = result.obs;
    } else {
      print("no data received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
