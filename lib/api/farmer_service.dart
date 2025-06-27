
import 'package:farmsanta_new/Constants/api_constants.dart';
import 'package:farmsanta_new/Services/crud_api.dart';

import '../Models/Farmer/Farmer.dart';

class FarmerServiceApi extends CrudApi {
  FarmerServiceApi()
      : super(crudUrl: ApiConstants.farmerProfile, fromMapFunc: Farmer.fromMap);

  static late FarmerServiceApi instance;

  static void init() {
    instance = FarmerServiceApi();
  }
}
