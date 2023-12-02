import 'package:flutter/material.dart';
import 'package:go_crypto/bloc/coins_bloc.dart';
import 'package:go_crypto/bloc/events/get_top_coins_event.dart';
import 'package:go_crypto/views/bottom_navigation_bar.dart';
import 'package:go_crypto/views/news_view.dart';
import 'package:go_crypto/views/top_coins_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _coinsBloc = CoinsBloc();
  var _index = 0;
  static const List<Widget> _pages = <Widget>[
    TopCoinsPage(),
    NewsView(),
  ];

  @override
  void initState() {
    _coinsBloc.add(GetCoinsTopListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBarView((index) {
            _index = index;
            setState(() {});
          }, _index),
        ),
      ),
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
    );
  }
}
