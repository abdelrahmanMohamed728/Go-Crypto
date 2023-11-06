import 'package:flutter/material.dart';
import 'package:go_crypto/data/model/news.dart';
import '../../res/fonts.dart';
import '../../utils/date_utils.dart';

class NewsItemView extends StatefulWidget {
  final News newsItem;

  const NewsItemView(this.newsItem, {super.key});

  @override
  State<NewsItemView> createState() => _NewsItemViewState();
}

class _NewsItemViewState extends State<NewsItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage(widget.newsItem.sourceInfo?.img ?? "")),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Michael Stone',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: mainFont,
                          fontSize: 24.0),
                    ),
                    Text(
                      GoDateUtils().fromTimestampToDate(
                          widget.newsItem.publishedOn ?? 0),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: mainFont,
                          fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0),
            child: Text(
              widget.newsItem.body ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.newsItem.imageurl ?? "",
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
