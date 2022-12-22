import 'package:mockito/annotations.dart';
import 'package:rick_and_morty_app/core/core.dart';

@GenerateMocks([], customMocks: [MockSpec<ICheckConnectivity>(onMissingStub: OnMissingStub.returnDefault)])
void main() {}
