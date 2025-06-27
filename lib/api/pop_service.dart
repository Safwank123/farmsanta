import '../Services/crud_api.dart';

class POPService extends CrudApi {
  POPService() : super();

  static late POPService instance;

  static void init() {
    instance = POPService();
  }
}
