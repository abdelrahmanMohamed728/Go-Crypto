import 'package:flutter/material.dart';
import 'package:go_crypto/res/colors.dart';
import 'package:go_crypto/res/routes.dart';
import 'package:go_crypto/views/item_details.dart';
import 'package:go_crypto/views/news_view.dart';
import 'package:go_crypto/views/subviews/crypto_list_item.dart';
import 'package:go_crypto/views/subviews/news_item_view.dart';
import 'package:go_crypto/views/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Crypto',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true),
      routes: {
        itemDetailsRoute: (context) => const ItemDetailsView(),
      },
      home: NewsView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(color: Colors.white)),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: backgroundStyle,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: WelcomeView(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, itemDetailsRoute);
                          },
                          child: const CryptoListItem());
                    }),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
