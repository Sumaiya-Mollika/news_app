import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/config/base.dart';
import 'package:news_app/src/widgets/article_card.dart';
import 'package:news_app/src/widgets/loadding.dart';

class BookMarksScreen extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(80, 88, 229, 0.6),
        centerTitle: true,
        title: Text('BookMarks News Headlines'),
      ),
      body: Container(
        child: Obx(
          () => !newsC.isLoading.value
              ? newsC.bookMarkNews.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: newsC.bookMarkNews.length,
                      itemBuilder: (context, index) {
                        final item = newsC.bookMarkNews[index];
                        return ArticleCard(route: 'bookmark', item: item);
                      })
                  : Center(
                      child: Text(
                      'BookMark is Empty',
                      style: TextStyle(color: Color.fromRGBO(80, 88, 229, 0.6), fontSize: 18, fontWeight: FontWeight.w600),
                    ))
              : Center(child: Loading()),
        ),
      ),
    );
  }
}
