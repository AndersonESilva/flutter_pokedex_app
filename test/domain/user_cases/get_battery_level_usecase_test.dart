import 'package:flutter_pokedex_app/core/infrastructure/platform/battery_service.dart';
import 'package:flutter_pokedex_app/core/utils/use_cases/use_case.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_battery_level_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'get_battery_level_usecase_test.mocks.dart';

@GenerateMocks([BatteryService])
void main() {
  late GetBatteryLevelUseCase getBatteryLevelUseCase;
  late MockBatteryService mockBatteryService;

  setUp(() {
    mockBatteryService = MockBatteryService();
    getBatteryLevelUseCase = GetBatteryLevelUseCase(mockBatteryService);
  });

  test('should return battery level when not null', () async {
    when(mockBatteryService.getBatteryLevel()).thenAnswer((_) async => 50);

    final result = await getBatteryLevelUseCase.call(NoParams());

    expect(result, 50);
    verify(mockBatteryService.getBatteryLevel()).called(1);
  });

  test('should return 0 when battery level is zero', () async {
    when(mockBatteryService.getBatteryLevel()).thenAnswer((_) async => null);

    final result = await getBatteryLevelUseCase.call(NoParams());

    expect(result, 0);
    verify(mockBatteryService.getBatteryLevel()).called(1);
  });
}
