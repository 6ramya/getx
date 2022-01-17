import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_demo/core/model/article_model.dart';
import 'package:getx_demo/core/repository/news_repo_impl.dart';
import 'package:getx_demo/core/repository/news_repository.dart';

class SearchNewsController extends GetxController {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getSearchedNews(searchTextController.text);
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
