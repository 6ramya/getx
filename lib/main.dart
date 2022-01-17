import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/feature/news_headline/binding/news_headline_binding.dart';
import 'package:getx_demo/feature/news_headline/view/news_headline_view.dart';
import 'package:getx_demo/feature/search_news/binding/search_news_binding.dart';
import 'package:getx_demo/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(primaryColor: Colors.blueGrey),
      getPages: [
        GetPage(
            name: "/news_headline",
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: "/search_news",
            page: () => SearchNewsView(),
            binding: SearchNewsBinding())
      ],
      initialRoute: "/news_headline",
    );
  }
}
