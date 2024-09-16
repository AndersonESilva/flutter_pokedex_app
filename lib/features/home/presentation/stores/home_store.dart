
import 'package:flutter_pokedex_app/domain/use_cases/get_battery_level_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/utils/use_cases/use_case.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final GetBatteryLevelUseCase getBatteryLevel;

  _HomeStore(this.getBatteryLevel);

  @observable
  int batteryLevel = 0;

  @action
  Future<void> getBatteryLevelInfo() async {
    runInAction(() async {
      try {
        batteryLevel = await getBatteryLevel.call(NoParams());
      } catch (e) {
        batteryLevel = 0;
      }
    });
  }
}
