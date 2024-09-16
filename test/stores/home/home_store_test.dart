import 'package:flutter_pokedex_app/core/utils/use_cases/use_case.dart';
import 'package:flutter_pokedex_app/domain/use_cases/get_battery_level_usecase.dart';
import 'package:flutter_pokedex_app/features/home/presentation/stores/home_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_store_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBatteryLevelUseCase>()])
void main() {
  late HomeStore homeStore;
  late MockGetBatteryLevelUseCase mockGetBatteryLevelUseCase;

  setUp(() {
    mockGetBatteryLevelUseCase = MockGetBatteryLevelUseCase();
    homeStore = HomeStore(mockGetBatteryLevelUseCase);
  });

  test('should update batteryLevel when getBatteryLevelInfo is called', () async {
    const expectedBatteryLevel = 80;

    when(mockGetBatteryLevelUseCase.call(NoParams()))
        .thenAnswer((_) async => expectedBatteryLevel);

    await homeStore.getBatteryLevelInfo();

    expect(homeStore.batteryLevel, expectedBatteryLevel);
    verify(mockGetBatteryLevelUseCase.call(NoParams())).called(1);
  });

  test('should keep the batteryLevel at 0 if the use case returns an error', () async {

    when(mockGetBatteryLevelUseCase.call(NoParams()))
        .thenThrow(Exception('Error getting battery level'));

    await homeStore.getBatteryLevelInfo();

    expect(homeStore.batteryLevel, 0);

    verify(mockGetBatteryLevelUseCase.call(NoParams())).called(1);
  });
}
