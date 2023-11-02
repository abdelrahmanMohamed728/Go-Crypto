import 'package:flutter/material.dart';
import 'package:go_crypto/views/subviews/news_item_view.dart';

import '../res/fonts.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        title: const Text('News',
            style: TextStyle(
                color: Colors.white, fontFamily: mainFont, fontSize: 34.0)),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return const NewsItemView();
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
