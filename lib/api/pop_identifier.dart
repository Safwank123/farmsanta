import '../Services/crud_api.dart';

class POPIdentifierApi extends CrudApi {
  POPIdentifierApi() : super();

  static late POPIdentifierApi instance;

  static void init() {
    instance = POPIdentifierApi();
  }
}
