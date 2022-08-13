import 'package:stocks_and_crypto/JSONObject.dart';
import 'package:stocks_and_crypto/constants.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// String getCurrentDateAndTime() {
//   // returns current date and time in the specified format
//   return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
// }

class BaseApi {
  // function which returns the crypto data in a map format
  Future getCryptoData(
      String function, String symbol, String interval, String market) async {
    try {
      var url = Uri.parse(
          "${baseUrl}query?function=$function&symbol=$symbol&market=$market&interval=$interval&apikey=$apiKey");
      return getData(url);
    } catch (e) {
      e.toString();
    }
  }

// function which returns the stock data in a map format
  Future getStocksData(String function, String symbol, String interval) async {
    try {
      var url = Uri.parse(
          "${baseUrl}query?function=$function&symbol=$symbol&interval=$interval&apikey=$apiKey");
      return getData(url);
    } catch (e) {
      e.toString();
    }
  }

  Future<Map<String,dynamic>> getData(var url) async {
    // fetching the response from url
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // decoding using jsonObject class
      JSONObject jsonObject = JSONObject(response.body);
      // returning the fetched data into a map format
      return jsonObject.getJSONMap();
    } else {
      throw Exception("Failed to load data");
    }
  }

}

/// DOCS: https://docs.flutter.dev/cookbook/networking/fetch-data
