// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonsStore on _PokemonsStore, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokemonsStore.pokemons', context: context);

  @override
  ObservableList<PokemonName> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonName> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonsStore.isLoading', context: context);

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
      Atom(name: '_PokemonsStore.errorExecuted', context: context);

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

  late final _$hasMoreAtom =
      Atom(name: '_PokemonsStore.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$fetchPokemonAsyncAction =
      AsyncAction('_PokemonsStore.fetchPokemon', context: context);

  @override
  Future<void> fetchPokemon({bool refresh = false}) {
    return _$fetchPokemonAsyncAction
        .run(() => super.fetchPokemon(refresh: refresh));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
isLoading: ${isLoading},
errorExecuted: ${errorExecuted},
hasMore: ${hasMore}
    ''';
  }
}
