import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_name.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_pokemons_usecase.dart';
import 'package:flutter_pokedex_app/features/pokemons/presentation/stores/pokemons_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'pokemons_store_test.mocks.dart';

@GenerateMocks([GetPokemonsUseCase])
void main() {
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;
  late PokemonsStore pokemonsStore;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    pokemonsStore = PokemonsStore(mockGetPokemonsUseCase);
  });

  test('should fetch pokemons and update store correctly', () async {
    final pokemonList = [
      PokemonName(name: 'pikachu'),
      PokemonName(name: 'bulbasaur'),
      PokemonName(name: 'ivysaur'),
      PokemonName(name: 'venusaur'),
      PokemonName(name: 'charmander'),
      PokemonName(name: 'charizard'),
      PokemonName(name: 'squirtle'),
      PokemonName(name: 'wartortle'),
      PokemonName(name: 'blastoise'),
      PokemonName(name: 'caterpie'),
      PokemonName(name: 'metapod'),
      PokemonName(name: 'butterfree'),
      PokemonName(name: 'weedle'),
      PokemonName(name: 'kakuna'),
      PokemonName(name: 'beedrill'),
      PokemonName(name: 'pidgey'),
      PokemonName(name: 'pidgeotto'),
      PokemonName(name: 'pidgeot'),
      PokemonName(name: 'rattata'),
      PokemonName(name: 'raticate')
    ];
    final result = Result<List<PokemonName>, Failure>.success(pokemonList);

    mockito.when(mockGetPokemonsUseCase.call(any))
        .thenAnswer((_) async => result);

    await pokemonsStore.fetchPokemon();

    expect(pokemonsStore.pokemons.length, 20);
    expect(pokemonsStore.pokemons[0].name, 'pikachu');
    expect(pokemonsStore.pokemons[1].name, 'bulbasaur');
    expect(pokemonsStore.isLoading, false);
    expect(pokemonsStore.errorExecuted, false);
    expect(pokemonsStore.hasMore, true);
  });

  test('should handle empty pokemon list', () async {
    final result = Result<List<PokemonName>, Failure>.success([]);

    mockito.when(mockGetPokemonsUseCase.call(any))
        .thenAnswer((_) async => result);

    await pokemonsStore.fetchPokemon();

    expect(pokemonsStore.pokemons.length, 0);
    expect(pokemonsStore.isLoading, false);
    expect(pokemonsStore.errorExecuted, false);
    expect(pokemonsStore.hasMore, false);
  });

  test('should handle fetch failure', () async {
    final result = Result<List<PokemonName>, Failure>.error(Failure(403));

    mockito.when(mockGetPokemonsUseCase.call(any))
        .thenAnswer((_) async => result);

    await pokemonsStore.fetchPokemon();

    expect(pokemonsStore.pokemons.length, 0);
    expect(pokemonsStore.isLoading, false);
    expect(pokemonsStore.errorExecuted, true);
    expect(pokemonsStore.hasMore, true);
  });

  test('should clear pokemons and reset page on refresh', () async {
    final pokemonList = [
      PokemonName(name: 'Pikachu'),
    ];
    final resultWithData = Result<List<PokemonName>, Failure>.success(pokemonList);
    final resultEmpty = Result<List<PokemonName>, Failure>.success([]);

    mockito.when(mockGetPokemonsUseCase.call(any))
        .thenAnswer((invocation) {
      final params = invocation.positionalArguments[0] as GetPokemonsParams;
      if (params.page == 1) return Future.value(resultWithData);
      return Future.value(resultEmpty);
    });

    await pokemonsStore.fetchPokemon(refresh: true);

    expect(pokemonsStore.pokemons.length, 1);
    expect(pokemonsStore.pokemons[0].name, 'Pikachu');
    expect(pokemonsStore.isLoading, false);
    expect(pokemonsStore.errorExecuted, false);
    expect(pokemonsStore.hasMore, false);
  });
}
