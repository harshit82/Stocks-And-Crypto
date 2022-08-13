import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stocks_and_crypto/stock/StockData.dart';

class Stocks extends StatelessWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
            }
            return snapshot.hasData
                ? const StockData()
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

// https://www.geeksforgeeks.org/implementing-rest-api-in-flutter/
