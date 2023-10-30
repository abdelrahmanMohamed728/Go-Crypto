import 'package:flutter/material.dart';

class CryptoListItem extends StatelessWidget {
  const CryptoListItem({super.key});

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
              child: Image.asset('assets/images/btc.png'),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    'BTC',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'BebasNeue',
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    'Bitcoin',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'BebasNeue',
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "\$34000",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'BebasNeue',
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text('+4.76%',
                      maxLines: 1,
                      style: TextStyle(
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
