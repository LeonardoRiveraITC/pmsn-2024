import 'dart:ffi';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pmsn2024/model/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductsDatabase{
  static final NAMEDB='DESPENSADB';
  static final VERSIONDB=1;

  static Database? _database;
  Future  <Database> get database async{
    if(_database  != null) return _database!;
    return _database = await _initDatabase();
  }

  Future <Database> _initDatabase () async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB=join(folder.path,NAMEDB);
    return openDatabase(pathDB,
    version: VERSIONDB,
    onCreate: ((db, version) {
      String query = '''
      CREATE TABLE productos(
        id INTEGER PRIMARY KEY,
        producto VARCHAR(30),
        cantidad INT,
        caducidad carchar(10)
      );
      ''';
      db.execute(query);
    }
    ),
    );
 }
  Future<int> insert(String tabla,Map<String,dynamic> data) async{ 
    final conexion = await database;
    return conexion.insert(tabla, data);
  }
  Future<int> update(String tabla,Map<String,dynamic> data) async{ 
    final conexion = await database;
    return conexion.update(tabla, data,where: 'id=?',whereArgs: [data['id']]);
  }
  Future<int> delete(String tabla,Int data) async{
    var conexion=await database;
    return conexion.delete(tabla,where: 'id=?',whereArgs: [data]);
  }
  Future<List<ProductsModel>> read(String tabla)  async{ 
     var conexion= await database;
     var products = await conexion.query(tabla);
     return products.map((e) => ProductsModel.fromMap(e)).toList();
  }

}