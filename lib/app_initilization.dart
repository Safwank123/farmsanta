

import 'package:farmsanta_new/api/common_service.dart';
import 'package:farmsanta_new/api/farmer_service.dart';
import 'package:farmsanta_new/api/market_service.dart';
import 'package:farmsanta_new/api/master-service.dart';
import 'package:farmsanta_new/api/message_service.dart';
import 'package:farmsanta_new/api/pop_identifier.dart';
import 'package:farmsanta_new/api/pop_service.dart';
import 'package:farmsanta_new/api/user_service.dart';

import 'api/farmer_profile.dart';

class AppInitilizer {
  //make singleton
  static void init() {
    UserServiceApi.init();
    FarmerServiceApi.init();
    MasterService.init();
    MessageServiceApi.init();
    POPIdentifierApi.init();
    CommonService.init();
    FarmerProfileApi.init();
    MarketServiceApi.init();
    POPService.init();
  }
}
