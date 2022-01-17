import 'package:getx_demo/core/model/article_model.dart';
import 'package:getx_demo/core/model/news_response_model.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadline();
  Future<List<Article>?> getSearchedNews(String query);
}
