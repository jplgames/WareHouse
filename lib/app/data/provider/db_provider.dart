// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';

import '../../core/models/type_model.dart';
import '../../modules/register/user.dart';
import '../service/setting_service.dart';
import '../../core/models/type_fields.dart';

class DataBaseProvider {
  static final DataBaseProvider instance = DataBaseProvider._init();

  static Database? _database;
  // ignore: unused_field
  final SettingsService _settingsService = Get.put(SettingsService());
  String userTableName = "users";
  DataBaseProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('warehouse.db');
    return _database!;
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2733928813.
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTENGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const boolType = "BOOLEAN NOT NULL";
    const integerType = "INTEGER NOT NULL";

    log('Criando Usuario');
    db.execute('''
      CREATE TABLE $userTableName
      (
        id $idType,
        full_name $textType,
        username $textType,
        password $textType
      )
      ''');

    db.execute('''CREATE TABLE ${TypeFields.typeTableName} (
        ${TypeFields.id} $idType,
        ${TypeFields.name} $textType,
        ${TypeFields.createdAt} $textType,
        ${TypeFields.createdBy} $textType, 
        FOREIGN KEY (${TypeFields.createdBy}) REFERENCES users (id)
        ON DELETE NO ACTION
      )''');
  }

  Future<User> register(User user) async {
    final db = await instance.database;
    await db;

    int insertId = await db.insert(userTableName, user.toJson());

    await db.insert(
      TypeFields.typeTableName,
      TypeModel(
        name: "Zeus",
        createdAt: DateTime.now().toString(),
        createdBy: insertId.toString(),
      ).toJson(),
    );

    return user.copy(id: insertId);
  }
}

register(User user) {}
