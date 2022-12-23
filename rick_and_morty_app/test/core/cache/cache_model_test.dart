import 'package:mockito/annotations.dart';
import 'package:rick_and_morty_app/core/core.dart';

@GenerateMocks([], customMocks: [MockSpec<CacheModel>(onMissingStub: OnMissingStub.returnDefault)])
void main() {}
