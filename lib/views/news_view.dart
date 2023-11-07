import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_crypto/bloc/events/news_event.dart';
import 'package:go_crypto/data/model/base_news_response.dart';
import 'package:go_crypto/views/subviews/news_item_view.dart';
import '../bloc/news_bloc.dart';
import '../bloc/state/go_state.dart';
import '../res/fonts.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(GetNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.white,
            fontFamily: mainFont,
            fontSize: 34.0,
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocBuilder<NewsBloc, GoState>(builder: (context, state) {
          if (state is GoLoading) {
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          } else if (state is GoError) {
            return Text(state.message != null ? state.message! : "");
          } else if (state is GoLoaded) {
            final newsList = (state.goModel as BaseNewsResponse).news;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: newsList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return NewsItemView(newsList![index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          } else {
            return const Text("Starting");
          }
        }),
      ),
    );
  }
}
