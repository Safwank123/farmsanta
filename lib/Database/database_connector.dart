import 'dart:io';


import 'package:farmsanta_new/Constants/Fields/common_field.dart';
import 'package:farmsanta_new/Constants/Fields/photo_field.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseConnector {
  static late DatabaseConnector instance;
  final String databaseName = "farmsanta.db";
  late Database db;
  static void init() {
    instance = DatabaseConnector();
  }

  DatabaseConnector() {
    initDatabase(databaseName);
  }

  //initilize and check for database existence
  void initDatabase(String databaseName) {
    databaseName = databaseName;
    if (!File(databaseName).existsSync()) {
      db = sqlite3.open(databaseName);
      createTables();
    } else {
      db = sqlite3.open(databaseName);
    }
  }

  //function to create a tables
  void createTables() {
    for (var element in tableCreateQueries) {
      db.execute(element);
    }
  }
}

final List<String> tableCreateQueries = [
  "CREATE TABLE IF NOT EXISTS ${TableNames.tbl_advisory_tag}(${CommonFieldNames.uuid} TEXT PRIMARY KEY, ${CommonFieldNames.tenantId} TEXT, ${CommonFieldNames.sequenceNumber} INTEGER, ${CommonFieldNames.name} TEXT, ${CommonFieldNames.description} TEXT, ${CommonFieldNames.groupName} TEXT, ${CommonFieldNames.globalIndicatorUuid} TEXT)",

  "CREATE TABLE IF NOT EXISTS ${TableNames.photos}(${PhotoFields.caption} TEXT, ${PhotoFields.fileName} TEXT, ${PhotoFields.photoId} TEXT)",

  "CREATE TABLE IF NOT EXISTS ${TableNames.cropTable}(${CommonFieldNames.uuid} TEXT PRIMARY KEY, ${CommonFieldNames.createdBy} TEXT, ${CommonFieldNames.updatedBy} TEXT, ${CommonFieldNames.createTimeStamp} TEXT, ${CommonFieldNames.updatedTimeStamp} TEXT, ${CommonFieldNames.startDate} TEXT, ${CommonFieldNames.endDate} TEXT, ${CommonFieldNames.sequenceNumber} TEXT, ${CommonFieldNames.name} TEXT, ${CommonFieldNames.description} TEXT, ${CommonFieldNames.groupName} TEXT, ${CommonFieldNames.globalIndicatorUuid} TEXT)",
];

enum TableNames {
  tbl_advisory_tag,
  photos,
  cropTable,
}
