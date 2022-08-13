import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/BaseAPI.dart';
import 'package:stocks_and_crypto/constants.dart';

class CryptoData extends StatefulWidget {
  const CryptoData({Key? key}) : super(key: key);

  @override
  State<CryptoData> createState() => _CryptoDataState();
}

class _CryptoDataState extends State<CryptoData> {
  BaseApi apiObject = BaseApi();

  late Future cryptoData =
      apiObject.getCryptoData(cryptoIntraday, "ETH", oneMinute, "USD");

  late Color containerColour;

  late String symbolValue;
  late String marketValue;
  late String highValue;
  late String lowValue;
  late String openValue;
  late String closeValue;

  @override
  initState() {
    super.initState();
    updateUI(cryptoData);
  }

  void updateUI(dynamic cryptoData) {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      // condition to change colour of the container based on index parity
      if (index % 2 != 0) {
        containerColour = const Color(backgroundColour);
      } else {
        containerColour = const Color(scaffoldColour);
      }
      return Card(
          child: Container(
        color: containerColour,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(symbolValue,
                    style: const TextStyle(color: Color(symbolColour))),
                Text(marketValue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "High: $highValue",
                  style: const TextStyle(color: Color(profitColour)),
                ),
                Text(
                  "Low: $lowValue",
                  style: const TextStyle(color: Color(lossColour)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Open: $openValue"),
                Text("Close: $closeValue"),
              ],
            )
          ],
        ),
      ));
    });
  }
}
