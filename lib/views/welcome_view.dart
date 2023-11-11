import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/go_crypto_removebg.png',
          fit: BoxFit.fill,
          width: 350,
          height: 350,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text('Welcome to Go Crypto',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BebasNeue',
                fontSize: 34.0,
              )),
        )
      ],
    );
  }
}
