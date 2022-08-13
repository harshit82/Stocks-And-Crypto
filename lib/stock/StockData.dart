import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/BaseAPI.dart';
import '../constants.dart';

class StockData extends StatefulWidget {
  const StockData({Key? key}) : super(key: key);

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  BaseApi apiObject = BaseApi();

  late Future stockData = apiObject.getStocksData(stocksIntraday, "IBM", oneMinute);

  late Color containerColour;

  late String symbolValue;
  late String openValue;
  late String closeValue;
  late String highValue;
  late String lowValue;
  late String volumeValue;

  @override
  initState() {
    super.initState();
    updateUI(stockData);
  }

  void updateUI(dynamic stockData) {

  } // intialize variables with the values from stock data

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
                Text(volumeValue),
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
