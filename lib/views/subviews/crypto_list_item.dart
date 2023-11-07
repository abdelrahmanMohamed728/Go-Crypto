import 'package:flutter/material.dart';
import 'package:go_crypto/data/model/coins_data.dart';

import '../../res/constants.dart';

class CryptoListItem extends StatefulWidget {
  final CoinsData coinsData;

  const CryptoListItem(this.coinsData, {super.key});

  @override
  State<CryptoListItem> createState() => _CryptoListItemState();
}

class _CryptoListItemState extends State<CryptoListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: const Color(0xff3b134d),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: SizedBox(
                width: 45,height: 45,
                child: Image.network(
                    imagesBaseUrl + (widget.coinsData.coinInfo?.imageUrl ?? "")),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    widget.coinsData.coinInfo?.name ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'BebasNeue',
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    widget.coinsData.coinInfo?.fullName ?? "",
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'BebasNeue',
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.coinsData.display?.uSD?.price.toString() ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'BebasNeue',
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                      widget.coinsData.display?.uSD?.changeHour.toString() ??
                          "",
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.green,
                        fontFamily: 'BebasNeue',
                        fontSize: 14.0,
                      )),
                )
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
