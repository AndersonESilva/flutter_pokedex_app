import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/presentation/widgets/error_row_widget.dart';
import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_info.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/pages/pokemon_info_page.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/stores/pokemon_info_store.dart';
import 'package:flutter_pokedex_app/features/pokemon_info/presentation/widgets/pokemon_info_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../stores/pokemon_info/pokemon_info_store_test.mocks.dart';

void main() {
  late MockGetPokemonInfoUseCase mockGetPokemonInfo;
  late PokemonInfoStore pokemonInfoStore;
  const pokemonName = 'pikachu';
  const pokemonImage = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png';

  setUp(() {
    mockGetPokemonInfo = MockGetPokemonInfoUseCase();
    pokemonInfoStore = PokemonInfoStore(mockGetPokemonInfo);

    GetIt.instance.registerSingleton<PokemonInfoStore>(pokemonInfoStore);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  Future<void> pumpWidgetWithStore(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PokemonInfoPage(pokemonName: pokemonName,),
      ),
    );
  }

  testWidgets('Display CircularProgressIndicator while loading', (WidgetTester tester) async {
    final mockPokemonInfo = PokemonInfo(image: pokemonImage, types: []);
    when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Result.success(mockPokemonInfo));

    await pumpWidgetWithStore(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Display ErrorRowWidget when an error occurs', (WidgetTester tester) async {
    when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Result.error(Failure(403)));

    await pumpWidgetWithStore(tester);
    await tester.pump();

    expect(find.byType(ErrorRowWidget), findsOneWidget);
  });

  testWidgets('Displays PokemonInfoCard when Pokemon is loaded', (WidgetTester tester) async {
    final mockPokemonInfo = PokemonInfo(image: pokemonImage, types: []);
    when(mockGetPokemonInfo.call(any))
        .thenAnswer((_) async => Result.success(mockPokemonInfo));

    await pumpWidgetWithStore(tester);
    await tester.pump();

    expect(find.byType(PokemonInfoCard), findsOneWidget);
  });
}
