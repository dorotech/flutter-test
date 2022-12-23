import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/core/core.dart';

class CharacterFavoriteCache implements CacheModel {
  static String modelValue = "CharacterFavoriteValue";
  static String boxValue = "CharacterFavoriteBox";
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
  Future<CharacterFavorite> getModel() async {
    try {
      Box box = await getBox();

      return await box.get(modelValue) ?? CharacterFavorite(listCharacter: []);
    } catch (e) {
      return CharacterFavorite(listCharacter: []);
    }
  }

  @override
  Future<void> setModel(model) async {
    if (model is CharacterFavorite) {
      Box box = await getBox();

      await box.put(modelValue, model);
    } else {
      throw "model is not a ListCharacterLovers";
    }
  }
}
