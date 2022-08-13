import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/BaseAPI.dart';
import '../constants.dart';

class StockData extends StatefulWidget {
  const StockData({Key? key}) : super(key: key);

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  late Future stockData;

  @override
  initState() {
    super.initState();
    // fetch data to display
    stockData = getStocksData(stocksIntraday, "IBM", oneMinute);
  }

  late Color containerColour;

  // String symbolValue = stockData.getString("Symbol");
  // String openValue = stockData.getString("open");
  // String closeValue = stockData.getString("close");
  // String highValue = stockData.getString("high");
  // String volumeValue = stockData.getString("volume");

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
                Text("Symbol", style: TextStyle(color: Color(symbolColour))),
                Text("Volume"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "High: ",
                  style: TextStyle(color: Color(profitColour)),
                ),
                Text(
                  "Low: ",
                  style: TextStyle(color: Color(lossColour)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Open: "),
                Text("Close: "),
              ],
            )
          ],
        ),
      ));
    });
  }
}
