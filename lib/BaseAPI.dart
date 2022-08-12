// DOCS: https://docs.flutter.dev/cookbook/networking/fetch-data

import 'dart:convert';
import 'package:stocks_and_crypto/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String getCurrentDateAndTime(){
  return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
}

Future getStocksData(String function, String symbol, String interval) async {
  try {
    var url = Uri.parse(
        "${baseUrl}query?function=$function&symbol=$symbol&interval=$interval&apikey=$apiKey");
    // fetching the response from url
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //var decodedData = BaseApi.fromJson(jsonDecode(response.body));
      var decodedData = jsonDecode(response.body);

      //TODO: add these values to map
      var symbol = decodedData["Meta Data"]["2. Symbol"];
      var open = decodedData["Time Series ($interval)"][getCurrentDateAndTime()][".1. open"];
      var close = decodedData["Time Series ($interval)"][getCurrentDateAndTime()][".4. close"];

      Map<String,dynamic> dataMap = {};

      // TODO: return the map
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {
      e.toString();
  }
}

class BaseApi {
  final String function, symbol, interval;

  BaseApi(
      {required this.function, required this.symbol, required this.interval});

  // factory BaseApi.fromJson(Map<String, dynamic> json) {
  //   return BaseApi(
  //     function: json['function'],
  //     symbol: json['symbol'],
  //     interval: json['interval'],
  //   );
  }

// factory BaseApi.fromMap(Map<String, dynamic> json) {
//   return BaseApi(
//       function: json['function'],
//       symbol: json['symbol'],
//       interval: json['interval']);
// }
//}