import 'CropName.dart';
import 'CropNameOriginal.dart';
import 'FarmOperation.dart';
import 'FarmOperationOriginal.dart';
import 'UserId.dart';

class Fields {
  FarmOperationOriginal? farmOperationOriginal;
  FarmOperation? farmOperation;
  CropNameOriginal? cropNameOriginal;
  CropName? cropName;
  UserId? userId;

  Fields({
    this.farmOperationOriginal,
    this.farmOperation,
    this.cropNameOriginal,
    this.cropName,
    this.userId,
  });

  Fields.fromJson(Map<String, dynamic> json) {
    farmOperationOriginal = json['farm_operation.original'] != null
        ? FarmOperationOriginal.fromJson(json['farm_operation.original'])
        : null;
    farmOperation = json['farm_operation'] != null
        ? FarmOperation.fromJson(json['farm_operation'])
        : null;
    cropNameOriginal = json['crop_name.original'] != null
        ? CropNameOriginal.fromJson(json['crop_name.original'])
        : null;
    cropName = json['crop_name'] != null
        ? CropName.fromJson(json['crop_name'])
        : null;
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (farmOperationOriginal != null) {
      data['farm_operation.original'] = farmOperationOriginal!.toJson();
    }
    if (farmOperation != null) {
      data['farm_operation'] = farmOperation!.toJson();
    }
    if (cropNameOriginal != null) {
      data['crop_name.original'] = cropNameOriginal!.toJson();
    }
    if (cropName != null) {
      data['crop_name'] = cropName!.toJson();
    }
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    return data;
  }
}
