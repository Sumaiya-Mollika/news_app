import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/config/base.dart';

import 'package:news_app/src/widgets/article_card.dart';
import 'package:news_app/src/widgets/custom_drawer.dart';
import 'package:news_app/src/widgets/loadding.dart';

class HomeScreen extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    newsC.getNews();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 229, 245),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(80, 88, 229, 0.6),
        centerTitle: true,
        title: Text('News Headlines'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Obx(
          () => !newsC.isLoading.value
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: newsC.newsHeadlines.length,
                  itemBuilder: (context, index) {
                    final item = newsC.newsHeadlines[index];
                    return ArticleCard(route: 'home', item: item);
                  })
              : Center(child: Loading()),
        ),
      ),
    );
  }
}
