// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonInfoStore on _PokemonInfoStore, Store {
  late final _$pokemonAtom =
      Atom(name: '_PokemonInfoStore.pokemon', context: context);

  @override
  PokemonInfo? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonInfo? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonInfoStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorExecutedAtom =
      Atom(name: '_PokemonInfoStore.errorExecuted', context: context);

  @override
  bool get errorExecuted {
    _$errorExecutedAtom.reportRead();
    return super.errorExecuted;
  }

  @override
  set errorExecuted(bool value) {
    _$errorExecutedAtom.reportWrite(value, super.errorExecuted, () {
      super.errorExecuted = value;
    });
  }

  late final _$getPokemonInfoAsyncAction =
      AsyncAction('_PokemonInfoStore.getPokemonInfo', context: context);

  @override
  Future<void> getPokemonInfo(String name) {
    return _$getPokemonInfoAsyncAction.run(() => super.getPokemonInfo(name));
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon},
isLoading: ${isLoading},
errorExecuted: ${errorExecuted}
    ''';
  }
}
