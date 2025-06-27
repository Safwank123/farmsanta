import '../Services/crud_api.dart';

class CommonService extends CrudApi {
  CommonService() : super();

  static late CommonService instance;

  static void init() {
    instance = CommonService();
  }
}
