// Mocks generated by Mockito 5.3.2 from annotations
// in rick_and_morty_app/test/core/cache/cache_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:hive/hive.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_and_morty_app/core/data/cache/cache_model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBox_0<E> extends _i1.SmartFake implements _i2.Box<E> {
  _FakeBox_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CacheModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockCacheModel extends _i1.Mock implements _i3.CacheModel {
  @override
  _i4.Future<void> setModel(dynamic model) => (super.noSuchMethod(
        Invocation.method(
          #setModel,
          [model],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> cleanModel() => (super.noSuchMethod(
        Invocation.method(
          #cleanModel,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Box<dynamic>> getBox() => (super.noSuchMethod(
        Invocation.method(
          #getBox,
          [],
        ),
        returnValue: _i4.Future<_i2.Box<dynamic>>.value(_FakeBox_0<dynamic>(
          this,
          Invocation.method(
            #getBox,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Box<dynamic>>.value(_FakeBox_0<dynamic>(
          this,
          Invocation.method(
            #getBox,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Box<dynamic>>);
}
