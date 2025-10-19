import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smivox_inventory_software/src/core/storage/storage_manager.dart';
import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await StorageManager.init();
  runApp(const MyApp());
}




