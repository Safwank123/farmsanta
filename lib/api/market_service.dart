import '../Services/crud_api.dart';

class MarketServiceApi extends CrudApi {
  MarketServiceApi() : super();

  static late MarketServiceApi instance;

  static void init() {
    instance = MarketServiceApi();
  }
}
