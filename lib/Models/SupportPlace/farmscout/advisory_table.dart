
import 'package:farmsanta_new/Models/SupportPlace/farmscout/water_requirement.dart';

import 'dosage.dart';
import 'preharvest_interval.dart';

class AdvisoryTable {
  String dataLabel;
  String formulation;
  String formulationType;
  String prodName;
  Dosage? dosage;
  String dosageMethod;
  WaterRequirement? waterRequirement;
  PreHarvestInterval? preHarvestInterval;
  String applicationMethod;
  String modeOfAction;
  String toxicityLevel;

  AdvisoryTable({
    required this.dataLabel,
    required this.formulation,
    required this.formulationType,
    required this.prodName,
    required this.dosage,
    required this.dosageMethod,
    required this.waterRequirement,
    required this.preHarvestInterval,
    required this.applicationMethod,
    required this.modeOfAction,
    required this.toxicityLevel,
  });

  factory AdvisoryTable.fromJson(Map<String, dynamic> json) {
    return AdvisoryTable(
      dataLabel: json['dataLabel'] != null ? json['dataLabel'] as String : '',
      formulation:
          json['formulation'] != null ? json['formulation'] as String : '',
      formulationType: json['formulationType'] != null
          ? json['formulationType'] as String
          : '',
      prodName: json['prodName'] != null ? json['prodName'] as String : '',
      dosage: json['dosage'] != null ? Dosage.fromJson(json['dosage']) : null,
      dosageMethod:
          json['dosageMethod'] != null ? json['dosageMethod'] as String : '',
      waterRequirement: json['waterRequirement'] != null
          ? WaterRequirement.fromJson(json['waterRequirement'])
          : null,
      preHarvestInterval: json['preHarvestInterval'] != null
          ? PreHarvestInterval.fromJson(json['preHarvestInterval'])
          : null,
      applicationMethod: json['applicationMethod'] != null
          ? json['applicationMethod'] as String
          : '',
      modeOfAction:
          json['modeOfAction'] != null ? json['modeOfAction'] as String : '',
      toxicityLevel:
          json['toxicityLevel'] != null ? json['toxicityLevel'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataLabel'] = dataLabel;
    data['formulation'] = formulation;
    data['formulationType'] = formulationType;
    data['prodName'] = prodName;
    data['dosage'] = dosage!.toJson();
    data['dosageMethod'] = dosageMethod;
    data['waterRequirement'] = waterRequirement!.toJson();
    data['preHarvestInterval'] = preHarvestInterval!.toJson();
    data['applicationMethod'] = applicationMethod;
    data['modeOfAction'] = modeOfAction;
    data['toxicityLevel'] = toxicityLevel;
    return data;
  }
}
