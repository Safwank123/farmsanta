
import 'package:farmsanta_new/Database/database_connector.dart';
import 'package:sqlite3/sqlite3.dart';

class CropQuery {
  Database db = DatabaseConnector.instance.db;

  void addCrop(name, email) {
    db.execute('INSERT INTO users (name, email) VALUES (?, ?)', [name, email]);
  }
}
