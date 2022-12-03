// import 'package:flutter_test/flutter_test.dart';
// import 'package:modular_test/modular_test.dart';

// class GetCharacterMock extends Mock
//     implements GetCharacterDatasource {}

// void main() {
//   late final GetCharacterDatasource datasource;
//   late final GetCharacterRepository repository;
//   late final GetCharacterUsecase usecase;

//   setUp(() {
//     LocalJsonLocalization.delegate.directories = [
//       'assets/lang',
//     ];

//     initModule(AppModule(), replaceBinds: [
//       Bind.singleton<GetCharacterDatasource>(
//         (i) => GetCharacterMock(),
//       ),
//     ]);

//     datasource = Modular.get<GetCharacterDatasource>();
//     repository = Modular.get<GetCharacterRepository>();
//     usecase = Modular.get<GetCharacterUsecase>();
//   });

//   test('Test', () async {
//     when(() => datasource()).thenAnswer((_) async {});

//     expect(usecase(), returnsNormally);
//   });
// }
