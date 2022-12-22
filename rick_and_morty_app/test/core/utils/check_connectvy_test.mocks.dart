// Mocks generated by Mockito 5.3.2 from annotations
// in rick_and_morty_app/test/core/utils/check_connectvy_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_and_morty_app/core/utils/check_connectvy.dart' as _i2;

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

/// A class which mocks [ICheckConnectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockICheckConnectivity extends _i1.Mock
    implements _i2.ICheckConnectivity {
  @override
  _i3.Future<bool> check() => (super.noSuchMethod(
        Invocation.method(
          #check,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}