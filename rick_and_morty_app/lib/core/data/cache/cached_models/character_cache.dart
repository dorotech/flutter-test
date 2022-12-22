import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/core/core.dart';

import '../cache.dart';

class DirectusUserMeCache implements CacheModel {
  static String modelValue = "CharacterValue";
  static String boxValue = "CharacterBox";
  @override
  Future<void> cleanModel() async {
    Box box = await getBox();

    await box.put(modelValue, null);
  }

  @override
  Future<Box> getBox() async {
    Box box;
    if (Hive.isBoxOpen(boxValue)) {
      box = Hive.box(boxValue);
    } else {
      box = await Hive.openBox(boxValue);
    }
    return box;
  }

  @override
  Future<Character?> getModel() async {
    try {
      Box box = await getBox();

      return await box.get(modelValue);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setModel(model) async {
    if (model is Character) {
      Box box = await getBox();

      await box.put(modelValue, model);
    } else {
      throw "model is not a Character";
    }
  }
}
