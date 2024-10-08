import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_pokemon_info_usecase.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/stores/pokemon_info_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'pokemon_info_store_test.mocks.dart';

@GenerateMocks([GetPokemonInfoUseCase])
void main() {
  late MockGetPokemonInfoUseCase mockGetPokemonInfo;
  late PokemonInfoStore pokemonInfoStore;
  const pokemonName = 'pikachu';

  setUp(() {
    mockGetPokemonInfo = MockGetPokemonInfoUseCase();
    pokemonInfoStore = PokemonInfoStore(mockGetPokemonInfo);
  });


  test('Must set pokemon when result is success', () async {

    final mockPokemonInfo = PokemonInfo(image: '', types: []);
    mockito.when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Result.success(mockPokemonInfo));

    await pokemonInfoStore.getPokemonInfo(pokemonName);

    expect(pokemonInfoStore.isLoading, false);
    expect(pokemonInfoStore.errorExecuted, false);
    expect(pokemonInfoStore.pokemon, mockPokemonInfo);
  });

  test('Must set errorExecuted to true when result is error', () async {

    mockito.when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Result.error(Failure(403)));

    await pokemonInfoStore.getPokemonInfo(pokemonName);

    expect(pokemonInfoStore.isLoading, false);
    expect(pokemonInfoStore.errorExecuted, true);
    expect(pokemonInfoStore.pokemon, isNull);
  });

  test('Should change isLoading correctly during the call', () async {

    final mockPokemonInfo = PokemonInfo(image: '', types: []);
    mockito.when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Future.delayed(
      Duration(milliseconds: 300),
          () => Result.success(mockPokemonInfo),
    ));

    final future = pokemonInfoStore.getPokemonInfo(pokemonName);
    expect(pokemonInfoStore.isLoading, true);

    await future;

    await asyncWhen((_) => pokemonInfoStore.isLoading == false);
    expect(pokemonInfoStore.isLoading, false);
    expect(pokemonInfoStore.pokemon, mockPokemonInfo);
  });
}
