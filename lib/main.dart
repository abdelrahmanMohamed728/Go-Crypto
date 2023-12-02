import 'package:flutter/material.dart';
import 'package:go_crypto/res/routes.dart';
import 'package:go_crypto/views/coin_details.dart';
import 'package:go_crypto/views/splash_screen.dart';

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
        itemDetailsRoute: (context) => const CoinDetailsView(),
      },
      home: const SplashScreen(),
    );
  }
}


