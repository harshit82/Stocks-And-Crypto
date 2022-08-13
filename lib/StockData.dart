import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/BaseAPI.dart';
import 'constants.dart';

class StockData extends StatefulWidget {
  const StockData({Key? key}) : super(key: key);

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  late Future stockDataMap;

  @override
  initState() {
    super.initState();
    stockDataMap = getStocksData(intraday, "IBM", oneMinute);
  }

  late Color containerColour;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (index % 2 == 0) {
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
                Text(
                  "Symbol",
                  style: TextStyle(color: Colors.yellowAccent),
                ),
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
