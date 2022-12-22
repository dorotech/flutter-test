import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/core/core.dart';
import 'package:rick_and_morty_app/features/list_characters/repository/list_characters_repository.dart';

import '../repository/list_characters_repository_test.mocks.dart';
import '../repository/mock_correct_response.dart';

class ListCharactersController {
  IListCharactersRepository listCharactersRepository = ListCharactersRepository();
  ListCharacter? listCharacter;

  Future getListCharacters() async {
    String data = await listCharactersRepository.getListChatactersRepository();
    try {
      listCharacter = listCharacterFromJson(data);
    } catch (e) {
      if (kDebugMode) print(e.toString());
      throw DefalutStrings.unknownError;
    }
  }
}

void main() {
  late ListCharactersController sut;
  late IListCharactersRepository listCharactersRepositorySpy;

  setUp(() {
    sut = ListCharactersController();
    listCharactersRepositorySpy = MockIListCharactersRepository();

    sut.listCharactersRepository = listCharactersRepositorySpy;
  });

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
        expect(sut.listCharacter != null, true);
        expect(sut.listCharacter?.info != null, true);
        expect(sut.listCharacter?.results?.length, 1);
      });
    });
  });
}
