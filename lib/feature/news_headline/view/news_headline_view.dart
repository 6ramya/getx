import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_demo/core/widget/drawer.dart';
import 'package:getx_demo/feature/news_headline/controller/news_headline_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
        appBar: AppBar(title: Text('News Headline'), centerTitle: true),
        drawer: getAppDrawer(),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.all(10),
                  child:
                      //  StaggeredGridView.countBuilder(
                      //   itemCount: controller.articles.length,
                      //   crossAxisCount: 4,
                      //   mainAxisSpacing: 4,
                      //   crossAxisSpacing: 8,
                      //   staggeredTileBuilder: (index) =>
                      //       StaggeredTile.count(2, index.isEven ? 3 : 2),
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         controller.articles[index].imageUrl != null
                      //             ? Image.network(
                      //                 controller.articles[index].imageUrl!,
                      //                 fit: BoxFit.contain,
                      //               )
                      // : Container(),
                      // SizedBox(
                      // height: 6,
                      // ),
                      // Text(controller.articles[index].title!),
                      // ],
                      // );
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.articles[index].imageUrl == null
                                    ? Container()
                                    : Image.network(
                                        controller.articles[index].imageUrl!),
                                SizedBox(height: 8),
                                Text(
                                  controller.articles[index].title!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(controller.articles[index].description!),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 10),
                );
        }));
  }
}
