
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<Map> getLocalData() async {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Map values = await storage.readAll();

  return values;
}