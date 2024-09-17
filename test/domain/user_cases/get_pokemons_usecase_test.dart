import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_name.dart';
import 'package:flutter_pokedex_app/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_pokemons_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'get_pokemons_usecase_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonsUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonsUseCase(mockRepository);
  });

  test('should return pokemon names from the repository', () async {
    final params = GetPokemonsParams(10, 1);
    final expectedPokemonNames = [PokemonName(name: 'Pikachu'), PokemonName(name: 'Bulbasaur')];
    final result = Result<List<PokemonName>, Failure>.success(expectedPokemonNames);

    when(mockRepository.getPokemonNames(limit: 10, offset: 0))
        .thenAnswer((_) async => result);

    final response = await useCase.call(params);

    expect(response, equals(result));
    verify(mockRepository.getPokemonNames(limit: 10, offset: 0)).called(1);
  });

  test('should handle failure from repository', () async {
    final params = GetPokemonsParams(10, 1);
    final result = Result<List<PokemonName>, Failure>.error(Failure(403));

    when(mockRepository.getPokemonNames(limit: 10, offset: 0))
        .thenAnswer((_) async => result);

    final response = await useCase.call(params);

    expect(response, equals(result));
    verify(mockRepository.getPokemonNames(limit: 10, offset: 0)).called(1);
  });
}
