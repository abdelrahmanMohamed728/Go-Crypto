import 'package:flutter/material.dart';
import 'package:go_crypto/views/subviews/chart_view.dart';
import '../res/colors.dart';
import '../res/fonts.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(color: Colors.white)),
      body: Container(
        decoration: backgroundStyle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BTC',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: mainFont,
                                fontSize: 16.0)),
                        Text('Bitcoin',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: mainFont,
                                fontSize: 28.0)),
                        Text('\$34000',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: mainFont,
                                fontSize: 28.0)),
                      ]),
                  const Spacer(),
                  Image.asset('assets/images/btc.png')
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 12.0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  child: const ChartView(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
