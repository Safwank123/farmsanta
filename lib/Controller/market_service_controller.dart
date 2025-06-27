import 'dart:convert';

import '../Constants/api_constants.dart';
import '../Models/Home/Price.dart';
import '../api/market_service.dart';

class MarketServiceController {
  static Future<List<Price>?> getPrice() async {
    String url = ApiConstants.priceFeed;

    try {
      var response = await MarketServiceApi.instance.get(url: url);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        List<Price> priceList =
            List<Price>.from(jsonResponse.map((x) => Price.fromJson(x)));
        print("price list size is ${priceList.length}");
        return priceList;
      }
    } catch (e) {
      print("item rate error is ${e.toString()}");
      print(e);
    }

    return null;
  }
}
