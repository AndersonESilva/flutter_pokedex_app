import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:flutter_pokedex_app/features/home/presentation/stores/home_store.dart';
import 'package:flutter_pokedex_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_pokedex_app/features/home/presentation/widgets/energy_bar_card.dart';
import 'package:mockito/mockito.dart';

import '../stores/home/home_store_test.mocks.dart';

void main() {
  late MockGetBatteryLevelUseCase mockGetPokemonsUseCase;
  late HomeStore homeStore;

  setUp(() {
    mockGetPokemonsUseCase = MockGetBatteryLevelUseCase();
    homeStore = HomeStore(mockGetPokemonsUseCase);

    GetIt.instance.registerSingleton<HomeStore>(homeStore);
  });

  Future<void> pumpWidgetWithStore(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
  }

  testWidgets('HomePage displays battery level', (WidgetTester tester) async {
    const int power = 50;
    mockito.when(mockGetPokemonsUseCase.call(any)).thenAnswer((_) async => power);

    await pumpWidgetWithStore(tester);

    await tester.pumpAndSettle();

    expect(find.byType(EnergyBarCard), findsOneWidget);
    expect(find.byWidgetPredicate((widget) =>
      widget is EnergyBarCard && widget.power == power.toDouble()), findsOneWidget);
  });
}
