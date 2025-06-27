
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Core/store.dart';
import 'package:farmsanta_new/Models/SupportPlace/POP/PopDetailsDTO.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/Common/id_name.dart';

class StoreHelper {
  static MyStore store = (VxState.store as MyStore);

  static List<String> getStringList(SignUpEnum key) {
    switch (key) {
      case SignUpEnum.education:
        return store.educationLevel;
      case SignUpEnum.uom:
        return store.uomList;
    }
  }

  static List<IdNameModel> getIdNameList(IdNameModelEnum key) {
    switch (key) {
      case IdNameModelEnum.territory:
        return store.territroy;
      case IdNameModelEnum.region:
        return store.region;
      case IdNameModelEnum.county:
        return store.county;
      case IdNameModelEnum.subcounty:
        return store.subcounty;
      case IdNameModelEnum.village:
        return store.village;
    }
  }

  static savePop(PoPModel model) {
    //TODO reconfig it
    //upddate api named bookmarked
    store.savedPopList.add(model);
  }

  static String getCropName(String uuid) {
    try {

      return store.cropList
          .firstWhere((element) => element.uuid == uuid)
          .cropName!;
    } catch (e) {
      return "N/A";
    }
  }
  static String getGrowthStage(String uuid) {
    try {

      return store.cropStageList
          .firstWhere((element) => element.uuid == uuid)
          .name!;
    } catch (e) {
      return "N/A";
    }
  }
}

enum SignUpEnum { education, uom }
