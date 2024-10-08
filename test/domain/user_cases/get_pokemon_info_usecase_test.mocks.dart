// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_pokedex_app/test/domain/user_cases/get_pokemon_info_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_pokedex_app/core/network/error/failure.dart' as _i6;
import 'package:flutter_pokedex_app/core/network/result.dart' as _i2;
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart' as _i7;
import 'package:flutter_pokedex_app/domain/entities/pokemon_name.dart' as _i5;
import 'package:flutter_pokedex_app/domain/repositories/pokemon_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T, E> extends _i1.SmartFake implements _i2.Result<T, E> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i3.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i5.PokemonName>, _i6.Failure>> getPokemonNames({
    required int? limit,
    required int? offset,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonNames,
          [],
          {
            #limit: limit,
            #offset: offset,
          },
        ),
        returnValue:
            _i4.Future<_i2.Result<List<_i5.PokemonName>, _i6.Failure>>.value(
                _FakeResult_0<List<_i5.PokemonName>, _i6.Failure>(
          this,
          Invocation.method(
            #getPokemonNames,
            [],
            {
              #limit: limit,
              #offset: offset,
            },
          ),
        )),
      ) as _i4.Future<_i2.Result<List<_i5.PokemonName>, _i6.Failure>>);

  @override
  _i4.Future<_i2.Result<_i7.PokemonInfo, _i6.Failure>> getPokemonInfo(
          {required String? nome}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemonInfo,
          [],
          {#nome: nome},
        ),
        returnValue: _i4.Future<_i2.Result<_i7.PokemonInfo, _i6.Failure>>.value(
            _FakeResult_0<_i7.PokemonInfo, _i6.Failure>(
          this,
          Invocation.method(
            #getPokemonInfo,
            [],
            {#nome: nome},
          ),
        )),
      ) as _i4.Future<_i2.Result<_i7.PokemonInfo, _i6.Failure>>);
}
