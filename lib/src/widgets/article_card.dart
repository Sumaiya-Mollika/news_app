import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/models/news_articles.dart';
import 'package:news_app/src/views/news_details_screen.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard({
    required this.item,
    required this.route,
  });

  final Articles item;
  String? route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () => Get.to(NewsDetailsScreen(
            route: route,
            news: item,
          )),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Stack(children: [
                  item.urlToImage == null
                      ? Container()
                      : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(item.urlToImage!)),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Card(
                      elevation: 0,
                      color: Color.fromRGBO(80, 88, 229, 0.6).withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text(item.author != null ? item.author! : 'N/A', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ]),
                Divider(),
                Text("${item.title}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
