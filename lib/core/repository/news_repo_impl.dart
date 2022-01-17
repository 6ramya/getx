import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_demo/core/model/article_model.dart';
import 'package:getx_demo/core/model/news_response_model.dart';
import 'package:getx_demo/core/repository/news_repository.dart';
import 'package:getx_demo/service/http_service.dart';
import 'package:getx_demo/service/http_service_implementation.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }
  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=us");

      print(response.data);
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles!;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchedNews(String query) async {
    // Response? response;
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
