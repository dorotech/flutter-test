// import 'package:app/data/datasources/get_character_by_id//get_character_by_id_datasource.dart';
// import 'package:app/domain/repositories/get_character_by_id//get_character_by_id_repository.dart';
// import 'package:app/domain/usecases/get_character_by_id//get_character_by_id_usecase.dart';
// import 'package:app/app_module.dart';

// import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:modular_test/modular_test.dart';

// class GetCharacterByIdMock extends Mock
//     implements GetCharacterByIdDatasource {}

// void main() {
//   late final GetCharacterByIdDatasource datasource;
//   late final GetCharacterByIdRepository repository;
//   late final GetCharacterByIdUsecase usecase;

//   setUp(() {
//     LocalJsonLocalization.delegate.directories = [
//       'assets/lang',
//     ];

//     initModule(AppModule(), replaceBinds: [
//       Bind.singleton<GetCharacterByIdDatasource>(
//         (i) => GetCharacterByIdMock(),
//       ),
//     ]);

//     datasource = Modular.get<GetCharacterByIdDatasource>();
//     repository = Modular.get<GetCharacterByIdRepository>();
//     usecase = Modular.get<GetCharacterByIdUsecase>();
//   });

//   test('Test', () async {
//     when(() => datasource()).thenAnswer((_) async {});

//     expect(usecase(), returnsNormally);
//   });
// }
