import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/core/core.dart';
import 'package:rick_and_morty_app/features/list_characters/controller/controller.dart';
import 'package:rick_and_morty_app/features/list_characters/repository/list_characters_repository.dart';

import '../../../core/cache/cache_model_test.mocks.dart';
import '../repository/list_characters_repository_test.mocks.dart';
import '../repository/mock_correct_response.dart';

void main() {
  late ListCharactersController sut;
  late IListCharactersRepository listCharactersRepositorySpy;
  late CacheModel cacheModelSpy;

  int idFake = faker.guid.hashCode;

  setUp(() {
    sut = ListCharactersController();
    listCharactersRepositorySpy = MockIListCharactersRepository();
    cacheModelSpy = MockCacheModel();

    sut.listCharactersRepository = listCharactersRepositorySpy;
    sut.characterFavoriteCache = cacheModelSpy;
  });

  void getCacheSuccess() {
    List<Character> characterFavorites = [Character(id: idFake)];
    when(cacheModelSpy.getModel()).thenAnswer(
      (realInvocation) async => CharacterFavorite(
        listCharacter: characterFavorites,
      ),
    );
  }

  group("GetListCharacters", () {
    group("Fails:", () {
      test("Should throw no connectvy if device is not connected in internet", () {
        /// Arrange
        when(listCharactersRepositorySpy.getListChatactersRepository()).thenThrow(DefalutStrings.noInternet);

        /// Act
        var test = sut.getListCharacters();

        /// Assert
        expect(test, throwsA(DefalutStrings.noInternet));
      });

      test("Should throw unknown error if data is wrong", () {
        /// Arrange
        when(listCharactersRepositorySpy.getListChatactersRepository()).thenAnswer((realInvocation) async => "");

        /// Act
        var test = sut.getListCharacters();

        /// Assert
        expect(test, throwsA(DefalutStrings.unknownError));
      });
    });

    group("Success:", () {
      test("Should throw unknown error if data is wrong", () async {
        /// Arrange
        when(listCharactersRepositorySpy.getListChatactersRepository())
            .thenAnswer((realInvocation) async => listCharactersCorrectResponseMock);

        /// Act
        await sut.getListCharacters();

        /// Assert
        expect(sut.listCharacter.info != null, true);
        expect(sut.listCharacter.results?.length, 1);
      });

      test("Should get favorites character", () async {
        /// Arrange
        sut.characterFavorites = [Character(id: idFake)];
        sut.showFavorite = true;

        /// ACT
        var list = await sut.getListCharacters();

        /// Assert
        expect(list != null, true);
        expect(sut.listCharacter.results?.length, 1);
        expect(sut.listCharacter.results?.first.id, idFake);
      });
    });
  });

  group("initCharactersFavorites:", () {
    test("Success: should get cache correctly", () async {
      /// Arrange
      getCacheSuccess();

      /// Act
      await sut.initCharactersFavorites();

      /// Assert
      verify(cacheModelSpy.getModel()).called(1);
      expect(sut.characterFavorites.length, 1);
      expect(sut.characterFavorites.first.id, idFake);
    });
  });

  group("setCharacterLover:", () {
    test("Success: should set cache correctly", () async {
      /// Arrange
      Character character = Character(id: idFake);
      getCacheSuccess();
      when(cacheModelSpy.setModel(any)).thenAnswer((realInvocation) async {});

      /// Act
      await sut.setCharacterLover(character);

      /// Assert
      verify(cacheModelSpy.getModel()).called(1);
      verify(cacheModelSpy.setModel(any)).called(1);
      expect(sut.characterFavorites.length, 2);
      expect(sut.characterFavorites.first.id, idFake);
    });
  });
}
