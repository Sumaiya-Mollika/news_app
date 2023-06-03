import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/config/api_end_point.dart';
import 'package:news_app/src/models/news_articles.dart';
import 'package:news_app/src/services/api_services.dart';
import 'package:news_app/src/widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsController extends GetxController with ApiServices {
  final newsHeadlines = RxList<Articles>([]);
  final bookMarkNews = RxList<Articles>([]);
  final isLoading = RxBool(false);

  getNews() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedHeadlinesJson = prefs.getString('cachedHeadlines');
    // check weather article has in cache or not
    if (cachedHeadlinesJson != null) {
      final cachedHeadlinesList = jsonDecode(cachedHeadlinesJson) as List<dynamic>;
      final headlines = cachedHeadlinesList.map((json) => Articles.fromJson(json as Map<String, dynamic>)).toList();
      newsHeadlines.clear();
      newsHeadlines.addAll(headlines);
    } else {
      isLoading.value = true;
      final params = {
        'country': 'us',
        'apiKey': ApiEndPoint.apiKey(),
      };
      final res = await getDynamic(path: ApiEndPoint.baseUrl(), queryParameters: params);
      final headlines = res.data['articles'].map((json) => Articles.fromJson(json as Map<String, dynamic>)).toList().cast<Articles>();

      if (headlines.isNotEmpty) {
        // Cache the headlines
        final cachedHeadlines = headlines.map((article) => article.toJson()).toList();
        await prefs.setString('cachedHeadlines', jsonEncode(cachedHeadlines));

        newsHeadlines.clear();
        newsHeadlines.addAll(headlines);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  saveBookmark({String? uid, Articles? item}) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('user-bookMarks');

    QuerySnapshot querySnapshot = await collectionRef.doc(uid).collection("bookMarks").where('title', isEqualTo: item?.title).get();

    if (querySnapshot.size > 0) {
      customSnackbar(title: 'Article already added', message: '', color: Colors.red, textColor: Colors.white);
    } else {
      return collectionRef.doc(uid).collection("bookMarks").doc().set({
        'author': item!.author,
        'title': item.title,
        'description': item.description,
        'url': item.url,
        'urlToImage': item.urlToImage,
        'publishedAt': item.publishedAt,
        'content': item.content,
      }).then(
        (value) => customSnackbar(
          title: 'Bookmark Added',
          message: '',
          color: Colors.green,
          textColor: Colors.white,
        ),
      );
    }
  }

  getBookMarks({String? uid}) async {
    isLoading.value = true;
    QuerySnapshot news = await FirebaseFirestore.instance.collection('user-bookMarks').doc(uid).collection("bookMarks").get();
    bookMarkNews.clear();
    for (var news in news.docs) {
      bookMarkNews.add(Articles(
          author: news['author'],
          title: news['title'],
          description: news['description'],
          url: news['url'],
          urlToImage: news['urlToImage'],
          publishedAt: news['publishedAt'],
          content: news['content']));
    }
    isLoading.value = false;
  }
}
