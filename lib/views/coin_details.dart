import 'package:flutter/material.dart';
import 'package:go_crypto/data/model/coins_data.dart';
import 'package:go_crypto/res/constants.dart';
import 'package:go_crypto/views/subviews/chart_view.dart';
import '../res/colors.dart';
import '../res/fonts.dart';

class CoinDetailsView extends StatefulWidget {
  const CoinDetailsView({super.key});

  @override
  State<CoinDetailsView> createState() => _CoinDetailsViewState();
}

class _CoinDetailsViewState extends State<CoinDetailsView> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final item = arguments[coinData] as CoinsData;
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.coinInfo?.name ?? "",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: mainFont,
                                fontSize: 16.0)),
                        Text(item.coinInfo?.fullName ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: mainFont,
                                fontSize: 28.0)),
                        Text(item.display?.uSD?.price ?? '0',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: mainFont,
                                fontSize: 28.0)),
                      ]),
                  const Spacer(),
                  Hero(
                    tag: item.coinInfo?.imageUrl ?? "",
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.network(
                          imagesBaseUrl + (item.coinInfo?.imageUrl ?? "")),
                    ),
                  ),
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
