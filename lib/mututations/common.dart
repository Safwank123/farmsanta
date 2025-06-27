
import 'package:farmsanta_new/Core/store.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Models/Common/id_name.dart';
import 'package:farmsanta_new/Models/Common/territory.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateGenderListMututation extends VxMutation<MyStore> {
  final List<String> genders;

  UpdateGenderListMututation(this.genders);
  @override
  perform() {
    store!.genders = genders;
  }
}

class UpdateEducationListMututation extends VxMutation<MyStore> {
  final List<String> educationNames;

  UpdateEducationListMututation(this.educationNames);
  @override
  perform() {
    store!.educationLevel = educationNames;
  }
}

class UpdateTerriotyList extends VxMutation<MyStore> {
  final List<IdNameModel> terriotryNames;

  UpdateTerriotyList(this.terriotryNames);
  @override
  perform() {
    store!.territroy = terriotryNames;
  }
}

class UpdateRegions extends VxMutation<MyStore> {
  final List<IdNameModel> ids;

  UpdateRegions(this.ids);
  @override
  perform() {
    store!.region = ids;
    store!.county.clear();
    store!.subcounty.clear();
    store!.village.clear();
  }
}

class UpdateCouty extends VxMutation<MyStore> {
  final List<IdNameModel> ids;

  UpdateCouty(this.ids);
  @override
  perform() {
    store!.county = ids;
    store!.subcounty.clear();
    store!.village.clear();
  }
}

class UpdateSubCouty extends VxMutation<MyStore> {
  final List<IdNameModel> ids;

  UpdateSubCouty(this.ids);
  @override
  perform() {
    store!.subcounty = ids;
    store!.village.clear();
  }
}

class UpdateVillage extends VxMutation<MyStore> {
  final List<IdNameModel> ids;

  UpdateVillage(this.ids);
  @override
  perform() {
    store!.village = ids;
  }
}

class UpdateCountriesList extends VxMutation<MyStore> {
  final List<TerritoryModel> countriesList;

  UpdateCountriesList(this.countriesList);
  @override
  perform() {
    store!.countries = countriesList;
  }
}

class UpdateUOMList extends VxMutation<MyStore> {
  final List<String> values;

  UpdateUOMList(this.values);
  @override
  perform() {
    store!.uomList = values;
  }
}

class UpdateCropsList extends VxMutation<MyStore> {
  final Map<String, List<CropModelShort>> values;

  UpdateCropsList(this.values);
  @override
  perform() {
    store!.cropsSignUp = values;
  }
}

class UpdateWeatherSection extends VxMutation<MyStore> {
  UpdateWeatherSection();
  @override
  perform() {}
}

class UpdateMarketPriceAppbar extends VxMutation<MyStore> {
  UpdateMarketPriceAppbar();
  @override
  perform() {}
}

class UpdateDiseaseListSection extends VxMutation<MyStore> {
  UpdateDiseaseListSection();
  @override
  perform() {}
}
