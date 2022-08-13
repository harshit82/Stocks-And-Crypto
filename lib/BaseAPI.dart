import 'dart:convert';
import 'package:stocks_and_crypto/JSONObject.dart';
import 'package:stocks_and_crypto/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String getCurrentDateAndTime() {
  return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
}

Future getStocksData(String function, String symbol, String interval) async {
  try {
    var url = Uri.parse(
        "${baseUrl}query?function=$function&symbol=$symbol&interval=$interval&apikey=$apiKey");
    // fetching the response from url
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // decoding using jsonObject class
      JSONObject jsonObject = JSONObject(response.body);

      String symbolValue = jsonObject.getString("Symbol");
      String openValue = jsonObject.getString("open");
      String closeValue = jsonObject.getString("close");
      String highValue = jsonObject.getString("high");
      String volumeValue = jsonObject.getString("volume");

      return jsonObject.getJSONMap();

      // var decodedData = jsonDecode(response.body);
      // //TODO: add these values to map
      // String symbol = decodedData["Meta Data"]["2. Symbol"];
      // double open = decodedData["Time Series ($interval)"]
      //     [getCurrentDateAndTime()][".1. open"];
      // double close = decodedData["Time Series ($interval)"]
      //     [getCurrentDateAndTime()][".4. close"];
      // double high = decodedData["Time Series ($interval)"]
      //     [getCurrentDateAndTime()][".2. high"];
      // double low = decodedData["Time Series ($interval)"]
      //     [getCurrentDateAndTime()][".3. low"];
      // double volume = decodedData["Time Series ($interval)"]
      //     [getCurrentDateAndTime()][".5. volume"];
      //
    } else {
      throw Exception("Failed to load data");
    }
  } catch (e) {
    e.toString();
  }
}

// class BaseApi {
//   final String function, symbol, interval;
//
//   BaseApi(
//       {required this.function, required this.symbol, required this.interval});
//
// // factory BaseApi.fromJson(Map<String, dynamic> json) {
// //   return BaseApi(
// //     function: json['function'],
// //     symbol: json['symbol'],
// //     interval: json['interval'],
// //   );
// }
//
// // factory BaseApi.fromMap(Map<String, dynamic> json) {
// //   return BaseApi(
// //       function: json['function'],
// //       symbol: json['symbol'],
// //       interval: json['interval']);
// // }
// //}

/// DOCS: https://docs.flutter.dev/cookbook/networking/fetch-data
