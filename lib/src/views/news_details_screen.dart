import 'package:flutter/material.dart';
import 'package:news_app/src/config/base.dart';
import 'package:news_app/src/helper/global_helper.dart';
import 'package:news_app/src/models/news_articles.dart';

class NewsDetailsScreen extends StatelessWidget with Base {
  String? route;
  Articles? news;
  NewsDetailsScreen({required this.route, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(80, 88, 229, 0.6),
        title: Text(
          news!.title!,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          if (route != 'bookmark')
            IconButton(
                onPressed: () {
                  newsC.saveBookmark(uid: authC.auth.currentUser!.uid, item: news);
                },
                icon: Icon(Icons.bookmark_add_outlined))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                if (news!.title != null)
                  Text(
                    news!.title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(45, 53, 215, 0.6),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        formatDateTime(date: news!.publishedAt!),
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        'By ',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Expanded(
                        child: Text(
                          news!.author != null ? news!.author! : 'N/A',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(45, 53, 215, 0.6),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
                news!.urlToImage != null
                    ? Image.network(
                        news!.urlToImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/news.png',
                        fit: BoxFit.fill,
                      ),
                SizedBox(
                  height: 10,
                ),
                if (news!.url != null)
                  Text(
                    news!.url!,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      fontSize: 15,
                    ),
                  ),
                if (news!.description != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      news!.description!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                if (news!.content != null)
                  Text(
                    news!.content!,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
