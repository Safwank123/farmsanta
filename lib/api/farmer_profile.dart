
import 'package:farmsanta_new/Constants/api_constants.dart';
import 'package:farmsanta_new/Models/Farmer/Farmer.dart';
import 'package:farmsanta_new/Services/crud_api.dart';

class FarmerProfileApi extends CrudApi {
  FarmerProfileApi()
      : super(crudUrl: ApiConstants.farmerProfile, fromMapFunc: Farmer.fromMap);

  static late FarmerProfileApi instance;

  static void init() {
    instance = FarmerProfileApi();
  }
}
