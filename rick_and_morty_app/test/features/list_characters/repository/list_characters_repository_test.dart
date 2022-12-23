import 'package:mockito/annotations.dart';
import 'package:rick_and_morty_app/features/list_characters/repository/list_characters_repository.dart';

@GenerateMocks([], customMocks: [MockSpec<IListCharactersRepository>(onMissingStub: OnMissingStub.returnDefault)])
void main() {}
