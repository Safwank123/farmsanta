

import 'package:farmsanta_new/Models/home/CurrentPrice.dart';
import 'package:farmsanta_new/Models/home/Packaging.dart';
import 'package:farmsanta_new/Models/home/PreviuosPrice.dart';
import 'package:farmsanta_new/Models/home/PriceCurrency.dart';

class Price {
  String uuid;
  String? createdBy;
  String? updatedBy;
  String? createdTimestamp;
  String? updatedTimestamp;
  String? startDate;
  String? endDate;
  String? tenantId;
  List<String>? territory;
  List<String>? region;
  String? commodityType;
  String? commodityName;
  String? productName;
  String? commodityDetails;
  String? location;
  String? tickerCode;
  String? status;
  String? priceDate;
  PreviousPrice? previousPrice;
  CurrentPrice? currentPrice;
  PriceCurrency? priceCurrency;
  Packaging? packaging;

  Price({
    required this.uuid,
    this.createdBy,
    this.updatedBy,
    this.createdTimestamp,
    this.updatedTimestamp,
    this.startDate,
    this.endDate,
    this.tenantId,
    this.territory,
    this.region,
    this.commodityType,
    this.commodityName,
    this.productName,
    this.commodityDetails,
    this.location,
    this.tickerCode,
    this.status,
    this.priceDate,
    this.previousPrice,
    this.currentPrice,
    this.priceCurrency,
    this.packaging,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      uuid: json['uuid'] != null ? json['uuid'] as String : '',
      createdBy: json['createdBy'] != null ? json['createdBy'] as String : null,
      updatedBy: json['updatedBy'] != null ? json['updatedBy'] as String : null,
      createdTimestamp: json['createdTimestamp'] != null
          ? json['createdTimestamp'] as String
          : null,
      updatedTimestamp: json['updatedTimestamp'] != null
          ? json['updatedTimestamp'] as String
          : null,
      startDate: json['startDate'] != null ? json['startDate'] as String : null,
      endDate: json['endDate'] != null ? json['endDate'] as String : null,
      tenantId: json['tenantId'] != null ? json['tenantId'] as String : null,
      territory: json['territory'] != null
          ? List<String>.from(json['territory'])
          : null,
      region: json['region'] != null ? List<String>.from(json['region']) : null,
      commodityType: json['commodityType'] != null
          ? json['commodityType'] as String
          : null,
      commodityName: json['commodityName'] != null
          ? json['commodityName'] as String
          : null,
      productName:
          json['productName'] != null ? json['productName'] as String : null,
      commodityDetails: json['commodityDetails'] != null
          ? json['commodityDetails'] as String
          : null,
      location: json['location'] != null ? json['location'] as String : null,
      tickerCode:
          json['tickerCode'] != null ? json['tickerCode'] as String : null,
      status: json['status'] != null ? json['status'] as String : null,
      priceDate: json['priceDate'] != null ? json['priceDate'] as String : null,
      previousPrice: json['previousPrice'] != null
          ? PreviousPrice.fromJson(json['previousPrice'])
          : null,
      currentPrice: json['currentPrice'] != null
          ? CurrentPrice.fromJson(json['currentPrice'])
          : null,
      priceCurrency: json['priceCurrency'] != null
          ? PriceCurrency.fromJson(json['priceCurrency'])
          : null,
      packaging: json['packaging'] != null
          ? Packaging.fromJson(json['packaging'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uuid'] = uuid;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdTimestamp'] = createdTimestamp;
    data['updatedTimestamp'] = updatedTimestamp;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['tenantId'] = tenantId;
    data['territory'] = territory;
    data['region'] = region;
    data['commodityType'] = commodityType;
    data['commodityName'] = commodityName;
    data['productName'] = productName;
    data['commodityDetails'] = commodityDetails;
    data['location'] = location;
    data['tickerCode'] = tickerCode;
    data['status'] = status;
    data['priceDate'] = priceDate;
    data['previousPrice'] =
        previousPrice?.toJson();
    data['currentPrice'] = currentPrice?.toJson();
    data['priceCurrency'] =
        priceCurrency?.toJson();
    data['packaging'] = packaging?.toJson();
    return data;
  }
}
