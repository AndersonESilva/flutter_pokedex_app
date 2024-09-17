import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';
import 'package:flutter_pokedex_app/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_pokemon_info_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_pokemons_usecase_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonInfoUseCase useCase;
  late MockPokemonRepository mockRepository;
  const pokemonName = 'pikachu';

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonInfoUseCase(mockRepository);
  });

  test('should return PokémonInfo when the repository call is successful', () async {

    final mockPokemonInfo = PokemonInfo(image: 'image', types: ['posion']);
    final result = Result<PokemonInfo, Failure>.success(mockPokemonInfo);
    when(mockRepository.getPokemonInfo(nome: pokemonName))
        .thenAnswer((_) async => result);

    final response = await useCase(pokemonName);

    expect(response, result);
    verify(mockRepository.getPokemonInfo(nome: pokemonName));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure when the call to the repository fails', () async {

    final result = Result<PokemonInfo, Failure>.error(Failure(403));
    when(mockRepository.getPokemonInfo(nome: pokemonName))
        .thenAnswer((_) async => result);

    final response = await useCase.call(pokemonName);

    expect(response, equals(result));
    verify(mockRepository.getPokemonInfo(nome: pokemonName));
    verifyNoMoreInteractions(mockRepository);
  });
}
