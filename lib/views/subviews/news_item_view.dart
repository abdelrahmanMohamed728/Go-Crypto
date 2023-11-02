import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/fonts.dart';

class NewsItemView extends StatefulWidget {
  const NewsItemView({super.key});

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
                child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage("assets/images/profile_placeholder.jpg")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michael Stone',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: mainFont,
                          fontSize: 24.0),
                    ),
                    Text(
                      '2m ago',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: mainFont,
                          fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0,20.0,8.0,0),
            child: Text(
              'Over the last 24 hours, approximately \$612.3 million worth of Bitcoin flowed into exchanges while \$1.5 billion was withdrawn, resulting in a net outflow of \$936.5 million. This massive movement of Bitcoin off exchanges reduces the circulating supply available for trading.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,32.0,8.0,0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/news_placeholder.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
