import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/BaseAPI.dart';
import 'constants.dart';

class StockData extends StatefulWidget {
  const StockData({Key? key}) : super(key: key);

  @override
  State<StockData> createState() => _StockDataState();
}

class _StockDataState extends State<StockData> {
  late Future list;

  @override
  initState(){
    super.initState();
    list = getStocksData(intraday,"IBM",oneMinute);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Card();
    });
  }
}
