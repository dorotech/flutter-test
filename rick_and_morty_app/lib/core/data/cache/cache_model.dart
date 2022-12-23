import 'package:hive/hive.dart';

abstract class CacheModel {
  Future<void> setModel(dynamic model);

  Future<void> cleanModel();

  dynamic getModel();

  Future<Box> getBox();
}
