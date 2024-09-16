import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/core/network/error/failure.dart';
import 'package:flutter_pokedex_app/core/network/result.dart';
import 'package:flutter_pokedex_app/domain/entities/pokemon_name.dart';
import 'package:flutter_pokedex_app/features/pokemons/presentation/pages/pokemons_page.dart';
import 'package:flutter_pokedex_app/features/pokemons/presentation/stores/pokemons_store.dart';
import 'package:flutter_pokedex_app/features/pokemons/presentation/widgets/pokemon_name_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../stores/pokemons/pokemons_store_test.mocks.dart';

void main() {
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;
  late PokemonsStore pokemonsStore;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    pokemonsStore = PokemonsStore(mockGetPokemonsUseCase);

    GetIt.instance.registerSingleton<PokemonsStore>(pokemonsStore);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  Future<void> pumpWidgetWithStore(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PokemonsPage(),
      ),
    );
  }

  testWidgets('displays list of pokemons', (WidgetTester tester) async {

    when(mockGetPokemonsUseCase.call(any)).thenAnswer((_) async => Result.success([
      PokemonName(name: 'Pikachu'),
      PokemonName(name: 'Bulbasaur'),
    ]));

    await pumpWidgetWithStore(tester);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byWidgetPredicate(
          (Widget widget) =>
      widget is PokemonNameCard &&
          (widget.pokemon.name == 'Pikachu' || widget.pokemon.name == 'Bulbasaur')
    ), findsNWidgets(2));
  });

  testWidgets('shows loading indicator while fetching pokemons', (WidgetTester tester) async {
    when(mockGetPokemonsUseCase.call(any)).thenAnswer((_) async {
      return Result.success([PokemonName(name: 'Pikachu')]);
    });

    await pumpWidgetWithStore(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));

    expect(find.text('Pikachu'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('displays error message when fetch fails', (WidgetTester tester) async {
    when(mockGetPokemonsUseCase.call(any)).thenAnswer((_) async => Result.error(Failure(403)));

    await pumpWidgetWithStore(tester);

    await tester.pump();

    expect(pokemonsStore.errorExecuted, isTrue);
  });
}
