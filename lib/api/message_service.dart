
import '../Services/crud_api.dart';

class MessageServiceApi extends CrudApi {
  MessageServiceApi() : super();


  static late MessageServiceApi instance;

  static void init() {
    instance = MessageServiceApi();
  }
}
